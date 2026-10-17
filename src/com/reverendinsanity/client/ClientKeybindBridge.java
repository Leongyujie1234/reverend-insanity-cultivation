// Recovered with CFR 0.152 from reverend-insanity-cultivation-1.0.0+26.1.2.jar (fix4 build, 2026-10-17). See CHANGELOG.md.
/*
 * Decompiled with CFR 0.152.
 */
package com.reverendinsanity.client;

import com.reverendinsanity.client.ApertureOrbRenderer;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.Proxy;

public class ClientKeybindBridge
implements InvocationHandler {
    public static Object[] KEY_MAPPINGS;
    public static Method CONSUME_CLICK_METHOD;
    public static Field PLAYER_FIELD;
    public static Field CONNECTION_FIELD;
    public static Method SEND_COMMAND_METHOD;
    public static Object[] EMPTY_ARGS;
    public static boolean HANDSHAKE_SENT;
    public static Object CATEGORY_OBJ;
    private static boolean INITIALIZED;
    private static int DISPATCH_ERROR_PRINTS;

    private static Class<?> findClass(String ... stringArray) {
        for (String string : stringArray) {
            try {
                return Class.forName(string);
            }
            catch (Throwable throwable) {
            }
        }
        return null;
    }

    public static void initCategory() {
        if (CATEGORY_OBJ != null) {
            return;
        }
        try {
            Class<?> clazz = ClientKeybindBridge.findClass("net.minecraft.resources.Identifier", "net.minecraft.resources.ResourceLocation");
            Class<?> clazz2 = ClientKeybindBridge.findClass("net.minecraft.client.KeyMapping$Category");
            if (clazz == null || clazz2 == null) {
                System.out.println("[Reverend Insanity Client] Keybind category unavailable; keybinds disabled.");
                return;
            }
            Object object = clazz.getMethod("fromNamespaceAndPath", String.class, String.class).invoke(null, "reverend_insanity", "cultivation");
            Method method = null;
            for (Method method2 : clazz2.getMethods()) {
                if (!Modifier.isStatic(method2.getModifiers()) || !"register".equals(method2.getName()) || method2.getParameterCount() != 1 || !method2.getParameterTypes()[0].isAssignableFrom(clazz)) continue;
                method = method2;
                break;
            }
            if (method == null) {
                System.out.println("[Reverend Insanity Client] Keybind category register method not found; keybinds disabled.");
                return;
            }
            CATEGORY_OBJ = method.invoke(null, object);
            System.out.println("[Reverend Insanity Client] Keybind category ready: reverend_insanity:cultivation");
        }
        catch (Throwable throwable) {
            CATEGORY_OBJ = null;
            System.out.println("[Reverend Insanity Client] Keybind category init failed; keybinds disabled: " + String.valueOf(throwable));
        }
    }

    public static void registerKey(int n, String string, int n2) {
        if (CATEGORY_OBJ == null) {
            return;
        }
        if (KEY_MAPPINGS == null || n < 0 || n >= KEY_MAPPINGS.length || KEY_MAPPINGS[n] != null) {
            return;
        }
        try {
            Object object;
            Class<?> clazz = Class.forName("net.minecraft.client.KeyMapping");
            if (CONSUME_CLICK_METHOD == null) {
                CONSUME_CLICK_METHOD = clazz.getMethod("consumeClick", new Class[0]);
            }
            Class<?> clazz2 = Class.forName("net.minecraft.client.KeyMapping$Category");
            Object obj = clazz.getConstructor(String.class, Integer.TYPE, clazz2).newInstance(string, n2, CATEGORY_OBJ);
            Class<?> clazz3 = Class.forName("net.fabricmc.fabric.api.client.keymapping.v1.KeyMappingHelper");
            ClientKeybindBridge.KEY_MAPPINGS[n] = object = clazz3.getMethod("registerKeyMapping", clazz).invoke(null, obj);
        }
        catch (Throwable throwable) {
            System.out.println("[Reverend Insanity Client] Keybind register failed for " + string + ": " + String.valueOf(throwable));
        }
    }

    private static void ensureConsumeClick() {
        if (CONSUME_CLICK_METHOD == null) {
            try {
                CONSUME_CLICK_METHOD = Class.forName("net.minecraft.client.KeyMapping").getMethod("consumeClick", new Class[0]);
            }
            catch (Throwable throwable) {
                // empty catch block
            }
        }
    }

    public static void hookTickEvent() {
        try {
            Object object = Class.forName("net.fabricmc.fabric.api.client.event.lifecycle.v1.ClientTickEvents").getField("END_CLIENT_TICK").get(null);
            Class<?> clazz = Class.forName("net.fabricmc.fabric.api.client.event.lifecycle.v1.ClientTickEvents$EndTick");
            Object object2 = Proxy.newProxyInstance(clazz.getClassLoader(), new Class[]{clazz}, new ClientKeybindBridge());
            Method method = ClientKeybindBridge.resolveRegisterMethod(object);
            if (method == null) {
                System.out.println("[Reverend Insanity Client] Event register method not found; hotkeys disabled.");
                return;
            }
            method.invoke(object, object2);
            System.out.println("[Reverend Insanity Client] Keybind tick hook registered.");
        }
        catch (Throwable throwable) {
            System.out.println("[Reverend Insanity Client] Tick hook failed: " + String.valueOf(throwable));
        }
    }

    private static Method resolveRegisterMethod(Object object) {
        try {
            return Class.forName("net.fabricmc.fabric.api.event.Event").getMethod("register", Object.class);
        }
        catch (Throwable throwable) {
            for (Method method : object.getClass().getMethods()) {
                if (!"register".equals(method.getName()) || method.getParameterCount() != 1 || method.getParameterTypes()[0] != Object.class || !Modifier.isPublic(method.getDeclaringClass().getModifiers())) continue;
                return method;
            }
            return null;
        }
    }

    public static void init() {
        if (INITIALIZED) {
            return;
        }
        INITIALIZED = true;
        KEY_MAPPINGS = new Object[7];
        EMPTY_ARGS = new Object[0];
        ClientKeybindBridge.initCategory();
        ClientKeybindBridge.registerKey(0, "key.reverend_insanity.cast_slot_1", 82);
        ClientKeybindBridge.registerKey(1, "key.reverend_insanity.cast_slot_2", 71);
        ClientKeybindBridge.registerKey(2, "key.reverend_insanity.cast_slot_3", 86);
        ClientKeybindBridge.registerKey(3, "key.reverend_insanity.cast_slot_4", 66);
        ClientKeybindBridge.registerKey(4, "key.reverend_insanity.open_aperture", 79);
        ClientKeybindBridge.registerKey(5, "key.reverend_insanity.open_refinement", 80);
        ClientKeybindBridge.registerKey(6, "key.reverend_insanity.meditate", 77);
        ClientKeybindBridge.ensureConsumeClick();
        ClientKeybindBridge.hookTickEvent();
        System.out.println("[Reverend Insanity Client] Keybind bridge ready for Minecraft 26.1.2!");
    }

    private static void reportDispatch(String string) {
        if (DISPATCH_ERROR_PRINTS < 4) {
            ++DISPATCH_ERROR_PRINTS;
            System.out.println("[Reverend Insanity Client] dispatch error: " + string);
        }
    }

    private static Field resolveField(Class<?> clazz, String string) {
        try {
            return clazz.getField(string);
        }
        catch (Throwable throwable) {
            for (Class<?> clazz2 = clazz; clazz2 != null && clazz2 != Object.class; clazz2 = clazz2.getSuperclass()) {
                try {
                    Field field = clazz2.getDeclaredField(string);
                    try {
                        field.setAccessible(true);
                    }
                    catch (Throwable throwable2) {
                        // empty catch block
                    }
                    return field;
                }
                catch (Throwable throwable3) {
                    continue;
                }
            }
            return null;
        }
    }

    private static Method resolveCommandMethod(Class<?> clazz) {
        try {
            return clazz.getMethod("sendCommand", String.class);
        }
        catch (Throwable throwable) {
            for (Class<?> clazz2 = clazz; clazz2 != null && clazz2 != Object.class; clazz2 = clazz2.getSuperclass()) {
                for (Method method : clazz2.getDeclaredMethods()) {
                    if (!"sendCommand".equals(method.getName()) || method.getParameterCount() != 1 || method.getParameterTypes()[0] != String.class) continue;
                    try {
                        method.setAccessible(true);
                    }
                    catch (Throwable throwable2) {
                        // empty catch block
                    }
                    return method;
                }
            }
            return null;
        }
    }

    public static void dispatchAction(Object object, int n) {
        try {
            if (object == null) {
                return;
            }
            if (PLAYER_FIELD == null && (PLAYER_FIELD = ClientKeybindBridge.resolveField(object.getClass(), "player")) == null) {
                ClientKeybindBridge.reportDispatch("player field not found on " + object.getClass().getName());
                return;
            }
            Object object2 = PLAYER_FIELD.get(object);
            if (object2 == null) {
                HANDSHAKE_SENT = false;
                return;
            }
            if (CONNECTION_FIELD == null && (CONNECTION_FIELD = ClientKeybindBridge.resolveField(object2.getClass(), "connection")) == null) {
                ClientKeybindBridge.reportDispatch("connection field not found on " + object2.getClass().getName());
                return;
            }
            Object object3 = CONNECTION_FIELD.get(object2);
            if (object3 == null) {
                return;
            }
            if (SEND_COMMAND_METHOD == null && (SEND_COMMAND_METHOD = ClientKeybindBridge.resolveCommandMethod(object3.getClass())) == null) {
                ClientKeybindBridge.reportDispatch("sendCommand method not found on " + object3.getClass().getName());
                return;
            }
            n = ApertureOrbRenderer.interceptAction(object, n);
            SEND_COMMAND_METHOD.invoke(object3, "trigger ri_action set " + n);
        }
        catch (Throwable throwable) {
            ClientKeybindBridge.reportDispatch(String.valueOf(throwable));
        }
    }

    @Override
    public Object invoke(Object object, Method method, Object[] objectArray) {
        try {
            String string = method.getName();
            if ("equals".equals(string) && objectArray != null && objectArray.length == 1) {
                return object == objectArray[0];
            }
            if ("hashCode".equals(string)) {
                return System.identityHashCode(object);
            }
            if (!"onEndTick".equals(string)) {
                return null;
            }
            if (objectArray == null || objectArray.length == 0 || CONSUME_CLICK_METHOD == null || KEY_MAPPINGS == null) {
                return null;
            }
            if (!HANDSHAKE_SENT) {
                HANDSHAKE_SENT = true;
                ClientKeybindBridge.dispatchAction(objectArray[0], 99);
            }
            for (int i = 0; i < KEY_MAPPINGS.length; ++i) {
                Object object2 = KEY_MAPPINGS[i];
                if (object2 == null || !Boolean.TRUE.equals(CONSUME_CLICK_METHOD.invoke(object2, EMPTY_ARGS))) continue;
                ClientKeybindBridge.dispatchAction(objectArray[0], i + 1);
            }
        }
        catch (Throwable throwable) {
            // empty catch block
        }
        return null;
    }

    static {
        INITIALIZED = false;
        DISPATCH_ERROR_PRINTS = 0;
    }
}

