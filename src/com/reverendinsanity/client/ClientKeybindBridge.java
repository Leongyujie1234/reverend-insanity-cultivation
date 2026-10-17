package com.reverendinsanity.client;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;

/**
 * Hardened keybind bridge for Minecraft 26.1.2 (client side).
 *
 * Fix history:
 *  - upstream: looked up "net.minecraft.resources.ResourceLocation" (renamed to Identifier in 26.x);
 *    the failed lookup left the keybind category null while the keybinds were still registered,
 *    which crashed the vanilla Key Binds screen (KeyBindsList$CategoryEntry NPE).
 *  - v2: resolved Identifier-first and skipped keybind registration when no category exists, but it
 *    hooked the client tick via events.getClass().getMethod("register", ...). The Fabric event
 *    implementation class is package-private, so registration threw IllegalAccessException and no
 *    hotkey (and no server handshake) ever worked.
 *  - v3 (this): registers the tick listener through the public Event superclass, adds resilient
 *    field/method resolution for the command dispatch and prints one-shot diagnostics.
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
    private static int DISPATCH_ERROR_PRINTS = 0;

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
        if (KEY_MAPPINGS == null || index < 0 || index >= KEY_MAPPINGS.length || KEY_MAPPINGS[index] != null) {
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
            Method register = resolveRegisterMethod(events);
            if (register == null) {
                System.out.println("[Reverend Insanity Client] Event register method not found; hotkeys disabled.");
                return;
            }
            register.invoke(events, proxy);
            System.out.println("[Reverend Insanity Client] Keybind tick hook registered.");
        } catch (Throwable t) {
            System.out.println("[Reverend Insanity Client] Tick hook failed: " + t);
        }
    }

    private static Method resolveRegisterMethod(Object events) {
        // Public API superclass first: the runtime implementation class is package-private and
        // invoking its method directly throws IllegalAccessException.
        try {
            return Class.forName("net.fabricmc.fabric.api.event.Event").getMethod("register", Object.class);
        } catch (Throwable ignored) {
            // fall through to the scan
        }
        for (Method m : events.getClass().getMethods()) {
            if ("register".equals(m.getName())
                    && m.getParameterCount() == 1
                    && m.getParameterTypes()[0] == Object.class
                    && Modifier.isPublic(m.getDeclaringClass().getModifiers())) {
                return m;
            }
        }
        return null;
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

    private static void reportDispatch(String msg) {
        if (DISPATCH_ERROR_PRINTS < 4) {
            DISPATCH_ERROR_PRINTS++;
            System.out.println("[Reverend Insanity Client] dispatch error: " + msg);
        }
    }

    private static Field resolveField(Class<?> cls, String name) {
        try {
            return cls.getField(name);
        } catch (Throwable ignored) {
            // fall back to declared fields (may be protected/private)
        }
        Class<?> c = cls;
        while (c != null && c != Object.class) {
            try {
                Field f = c.getDeclaredField(name);
                try {
                    f.setAccessible(true);
                } catch (Throwable ignored) {
                    // the outer get() will surface the real problem
                }
                return f;
            } catch (Throwable ignored) {
                c = c.getSuperclass();
            }
        }
        return null;
    }

    private static Method resolveCommandMethod(Class<?> connClass) {
        try {
            return connClass.getMethod("sendCommand", String.class);
        } catch (Throwable ignored) {
            // fall back to declared methods
        }
        Class<?> c = connClass;
        while (c != null && c != Object.class) {
            for (Method m : c.getDeclaredMethods()) {
                if ("sendCommand".equals(m.getName())
                        && m.getParameterCount() == 1
                        && m.getParameterTypes()[0] == String.class) {
                    try {
                        m.setAccessible(true);
                    } catch (Throwable ignored) {
                        // the outer invoke will surface the real problem
                    }
                    return m;
                }
            }
            c = c.getSuperclass();
        }
        return null;
    }

    public static void dispatchAction(Object minecraft, int action) {
        try {
            if (minecraft == null) {
                return;
            }
            if (PLAYER_FIELD == null) {
                PLAYER_FIELD = resolveField(minecraft.getClass(), "player");
                if (PLAYER_FIELD == null) {
                    reportDispatch("player field not found on " + minecraft.getClass().getName());
                    return;
                }
            }
            Object player = PLAYER_FIELD.get(minecraft);
            if (player == null) {
                HANDSHAKE_SENT = false;
                return;
            }
            if (CONNECTION_FIELD == null) {
                CONNECTION_FIELD = resolveField(player.getClass(), "connection");
                if (CONNECTION_FIELD == null) {
                    reportDispatch("connection field not found on " + player.getClass().getName());
                    return;
                }
            }
            Object connection = CONNECTION_FIELD.get(player);
            if (connection == null) {
                return;
            }
            if (SEND_COMMAND_METHOD == null) {
                SEND_COMMAND_METHOD = resolveCommandMethod(connection.getClass());
                if (SEND_COMMAND_METHOD == null) {
                    reportDispatch("sendCommand method not found on " + connection.getClass().getName());
                    return;
                }
            }
            if (action == 5) {
                action = 50;
            }
            if (action == 6) {
                action = 60;
            }
            SEND_COMMAND_METHOD.invoke(connection, "trigger ri_action set " + action);
        } catch (Throwable t) {
            reportDispatch(String.valueOf(t));
        }
    }

    public Object invoke(Object proxy, Method method, Object[] args) {
        try {
            String name = method.getName();
            if ("equals".equals(name) && args != null && args.length == 1) {
                return proxy == args[0];
            }
            if ("hashCode".equals(name)) {
                return System.identityHashCode(proxy);
            }
            if (!"onEndTick".equals(name)) {
                return null;
            }
            if (args == null || args.length == 0 || CONSUME_CLICK_METHOD == null || KEY_MAPPINGS == null) {
                return null;
            }
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
        } catch (Throwable ignored) {
            // never crash the client from a keybind dispatch
        }
        return null;
    }
}
