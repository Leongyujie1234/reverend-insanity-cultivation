package com.reverendinsanity.client;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;

/**
 * Hardened keybind bridge for Minecraft 26.1.2 (client side).
 *
 * Original build looked up "net.minecraft.resources.ResourceLocation", which no
 * longer exists in 26.x (renamed to "net.minecraft.resources.Identifier").
 * The failed lookup left CATEGORY_OBJ null, and KeyMapping instances were still
 * constructed with a null category, which crashes the vanilla Key Binds screen
 * (KeyBindsList$CategoryEntry NPE: "category is null").
 *
 * Fix: resolve the identifier class dynamically (Identifier first, then
 * ResourceLocation), locate KeyMapping$Category.register reflectively, and if
 * no category can be created, register no keybinds at all. A missing keybind
 * is harmless; the /trigger ri_action path keeps working either way.
 */
public class ClientKeybindBridge implements InvocationHandler {

    public static Object[] KEY_MAPPINGS;
    public static Method CONSUME_CLICK_METHOD;
    public static Field PLAYER_FIELD;
    public static Field CONNECTION_FIELD;
    public static Method SEND_COMMAND_METHOD;
    public static Object[] EMPTY_ARGS;
    public static boolean HANDSHAKE_SENT;
    public static Object CATEGORY_OBJ;

    private static boolean INITIALIZED = false;

    public ClientKeybindBridge() {
    }

    private static Class<?> findClass(String... names) {
        for (String name : names) {
            try {
                return Class.forName(name);
            } catch (Throwable ignored) {
                // try the next candidate
            }
        }
        return null;
    }

    public static void initCategory() {
        if (CATEGORY_OBJ != null) {
            return;
        }
        try {
            Class<?> idClass = findClass(
                    "net.minecraft.resources.Identifier",
                    "net.minecraft.resources.ResourceLocation");
            Class<?> catClass = findClass("net.minecraft.client.KeyMapping$Category");
            if (idClass == null || catClass == null) {
                System.out.println("[Reverend Insanity Client] Keybind category unavailable; keybinds disabled.");
                return;
            }
            Object id = idClass
                    .getMethod("fromNamespaceAndPath", String.class, String.class)
                    .invoke(null, "reverend_insanity", "cultivation");
            Method register = null;
            for (Method m : catClass.getMethods()) {
                if (Modifier.isStatic(m.getModifiers())
                        && "register".equals(m.getName())
                        && m.getParameterCount() == 1
                        && m.getParameterTypes()[0].isAssignableFrom(idClass)) {
                    register = m;
                    break;
                }
            }
            if (register == null) {
                System.out.println("[Reverend Insanity Client] Keybind category register method not found; keybinds disabled.");
                return;
            }
            CATEGORY_OBJ = register.invoke(null, id);
            System.out.println("[Reverend Insanity Client] Keybind category ready: reverend_insanity:cultivation");
        } catch (Throwable t) {
            CATEGORY_OBJ = null;
            System.out.println("[Reverend Insanity Client] Keybind category init failed; keybinds disabled: " + t);
        }
    }

    public static void registerKey(int index, String translationKey, int glfwKey) {
        if (CATEGORY_OBJ == null) {
            return;
        }
        if (KEY_MAPPINGS != null && index >= 0 && index < KEY_MAPPINGS.length && KEY_MAPPINGS[index] != null) {
            return;
        }
        try {
            Class<?> kmClass = Class.forName("net.minecraft.client.KeyMapping");
            if (CONSUME_CLICK_METHOD == null) {
                CONSUME_CLICK_METHOD = kmClass.getMethod("consumeClick");
            }
            Class<?> catClass = Class.forName("net.minecraft.client.KeyMapping$Category");
            Object mapping = kmClass
                    .getConstructor(String.class, Integer.TYPE, catClass)
                    .newInstance(translationKey, glfwKey, CATEGORY_OBJ);
            Class<?> helper = Class.forName("net.fabricmc.fabric.api.client.keymapping.v1.KeyMappingHelper");
            Object registered = helper
                    .getMethod("registerKeyMapping", kmClass)
                    .invoke(null, mapping);
            KEY_MAPPINGS[index] = registered;
        } catch (Throwable t) {
            System.out.println("[Reverend Insanity Client] Keybind register failed for " + translationKey + ": " + t);
        }
    }

    private static void ensureConsumeClick() {
        if (CONSUME_CLICK_METHOD == null) {
            try {
                CONSUME_CLICK_METHOD = Class.forName("net.minecraft.client.KeyMapping").getMethod("consumeClick");
            } catch (Throwable ignored) {
                // handshake will simply not run
            }
        }
    }

    public static void hookTickEvent() {
        try {
            Object events = Class.forName("net.fabricmc.fabric.api.client.event.lifecycle.v1.ClientTickEvents")
                    .getField("END_CLIENT_TICK")
                    .get(null);
            Class<?> endTick = Class.forName("net.fabricmc.fabric.api.client.event.lifecycle.v1.ClientTickEvents$EndTick");
            Object proxy = Proxy.newProxyInstance(
                    endTick.getClassLoader(),
                    new Class<?>[]{endTick},
                    new ClientKeybindBridge());
            events.getClass().getMethod("register", Object.class).invoke(events, proxy);
        } catch (Throwable t) {
            System.out.println("[Reverend Insanity Client] Tick hook failed: " + t);
        }
    }

    public static void init() {
        if (INITIALIZED) {
            return;
        }
        INITIALIZED = true;
        KEY_MAPPINGS = new Object[7];
        EMPTY_ARGS = new Object[0];
        initCategory();
        registerKey(0, "key.reverend_insanity.cast_slot_1", 82);
        registerKey(1, "key.reverend_insanity.cast_slot_2", 71);
        registerKey(2, "key.reverend_insanity.cast_slot_3", 86);
        registerKey(3, "key.reverend_insanity.cast_slot_4", 66);
        registerKey(4, "key.reverend_insanity.open_aperture", 79);
        registerKey(5, "key.reverend_insanity.open_refinement", 80);
        registerKey(6, "key.reverend_insanity.meditate", 77);
        ensureConsumeClick();
        hookTickEvent();
        System.out.println("[Reverend Insanity Client] Keybind bridge ready for Minecraft 26.1.2!");
    }

    public static void dispatchAction(Object minecraft, int action) {
        try {
            if (PLAYER_FIELD == null) {
                PLAYER_FIELD = minecraft.getClass().getField("player");
            }
            Object player = PLAYER_FIELD.get(minecraft);
            if (player == null) {
                HANDSHAKE_SENT = false;
                return;
            }
            if (CONNECTION_FIELD == null) {
                CONNECTION_FIELD = player.getClass().getField("connection");
            }
            Object connection = CONNECTION_FIELD.get(player);
            if (connection == null) {
                return;
            }
            if (SEND_COMMAND_METHOD == null) {
                SEND_COMMAND_METHOD = connection.getClass().getMethod("sendCommand", String.class);
            }
            if (action == 5) {
                action = 50;
            }
            if (action == 6) {
                action = 60;
            }
            String command = "trigger ri_action set " + action;
            SEND_COMMAND_METHOD.invoke(connection, command);
        } catch (Throwable ignored) {
            // never crash the client from a keybind dispatch
        }
    }

    public Object invoke(Object proxy, Method method, Object[] args) {
        try {
            if (args != null && CONSUME_CLICK_METHOD != null) {
                if (!HANDSHAKE_SENT) {
                    HANDSHAKE_SENT = true;
                    dispatchAction(args[0], 99);
                }
                for (int i = 0; i < KEY_MAPPINGS.length; i++) {
                    Object mapping = KEY_MAPPINGS[i];
                    if (mapping != null) {
                        if (Boolean.TRUE.equals(CONSUME_CLICK_METHOD.invoke(mapping, EMPTY_ARGS))) {
                            dispatchAction(args[0], i + 1);
                        }
                    }
                }
            }
        } catch (Throwable ignored) {
            // never crash the client from a keybind dispatch
        }
        return null;
    }
}
