// Recovered with CFR 0.152 from reverend-insanity-cultivation-1.0.0+26.1.2.jar (fix4 build, 2026-10-17). See CHANGELOG.md.
/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  net.minecraft.client.gui.Font
 *  net.minecraft.client.gui.GuiGraphicsExtractor
 *  net.minecraft.network.chat.Component
 */
package com.reverendinsanity.client;

import com.reverendinsanity.client.ApertureOrbScreen;
import com.reverendinsanity.client.ClientKeybindBridge;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import net.minecraft.client.gui.Font;
import net.minecraft.client.gui.GuiGraphicsExtractor;
import net.minecraft.network.chat.Component;

public class ApertureOrbRenderer
implements InvocationHandler {
    public int buttonActionCode;
    public static Object CACHED_CLIENT;
    public static Field WIDTH_FIELD;
    public static Field HEIGHT_FIELD;
    public static Field FONT_FIELD;
    public static Method ADD_WIDGET_METHOD;
    public static Method LITERAL_METHOD;

    public ApertureOrbRenderer(int n) {
        this.buttonActionCode = n;
    }

    // Recovered source note: the original bytecode throws checked exceptions directly
    // (sneaky-throws, no try/catch or throws clause). Declared as "throws Throwable" here so
    // the recovered source compiles. All call sites already wrap calls in try/catch(Throwable).
    public static Object makeComponent(String string) throws Throwable {
        if (LITERAL_METHOD == null) {
            LITERAL_METHOD = Class.forName("net.minecraft.network.chat.Component").getMethod("literal", Class.forName("java.lang.String"));
        }
        return LITERAL_METHOD.invoke(null, string);
    }

    public static int interceptAction(Object object, int n) {
        if (n == 5) {
            ApertureOrbRenderer.openModdedScreen(object, 0);
            return 99;
        }
        if (n == 6) {
            ApertureOrbRenderer.openModdedScreen(object, 1);
            return 99;
        }
        return n;
    }

    public static void drawApertureGlassOrb(GuiGraphicsExtractor guiGraphicsExtractor, Font font, int n, int n2, int n3) {
        double d = (double)(System.currentTimeMillis() % 100000L) * 0.004;
        for (int i = -56; i <= 56; i += 4) {
            int n4 = (int)Math.sqrt(3520 - i * i) / 4 * 4;
            guiGraphicsExtractor.fill(n - n4, n2 + i, n + n4, n2 + i + 4, 784920306);
            int n5 = (int)(Math.sin(d + (double)i * 0.08) * 4.0) + 4;
            if (i >= n5) {
                guiGraphicsExtractor.fill(n - n4 + 4, n2 + i, n + n4 - 4, n2 + i + 4, i <= n5 + 4 ? -577968464 : (n3 == 0 ? -869360021 : -859211234));
            }
            guiGraphicsExtractor.fill(n - n4, n2 + i, n - n4 + 4, n2 + i + 4, -13426672);
            guiGraphicsExtractor.fill(n + n4 - 4, n2 + i, n + n4, n2 + i + 4, -13426672);
            guiGraphicsExtractor.fill(n - n4 + 4, n2 + i, n - n4 + 8, n2 + i + 4, 0x77FFFFFF);
            guiGraphicsExtractor.fill(n + n4 - 8, n2 + i, n + n4 - 4, n2 + i + 4, 1722147563);
            if (Math.abs(i) == 52) {
                guiGraphicsExtractor.fill(n - n4, n2 + i, n - n4 + 12, n2 + i + 4, -13426672);
                guiGraphicsExtractor.fill(n + n4 - 12, n2 + i, n + n4, n2 + i + 4, -13426672);
            }
            if (Math.abs(i) >= 56) {
                guiGraphicsExtractor.fill(n - n4, n2 + i, n + n4, n2 + i + 4, -13426672);
            }
            if (i < -44 || i > -16) continue;
            guiGraphicsExtractor.fill(n - n4 + 8, n2 + i, n - n4 + 16, n2 + i + 4, -855638017);
        }
        if (font != null) {
            guiGraphicsExtractor.text(font, "Aperture", n + -22, n2 + -22, -12966894, false);
            guiGraphicsExtractor.text(font, "Primeval Sea", n + -34, n2 + 18, -132884, false);
        }
    }

    public static void drawCultivationCard(GuiGraphicsExtractor guiGraphicsExtractor, Font font, int n, int n2, int n3, int n4, int n5, int n6, String string, int n7) {
        guiGraphicsExtractor.fill(n, n2, n + n3, n2 + n4, -13426672);
        guiGraphicsExtractor.fill(n + 1, n2 + 1, n + n3 - 1, n2 + n4 - 1, -5205402);
        guiGraphicsExtractor.fill(n + 1, n2 + 1, n + n3 - 3, n2 + n4 - 3, -397608);
        if (n5 >= n && n5 <= n + n3 && n6 >= n2 && n6 <= n2 + n4) {
            guiGraphicsExtractor.fill(n + 3, n2 + 3, n + n3 - 3, n2 + n4 - 3, -661816);
        } else {
            guiGraphicsExtractor.fill(n + 3, n2 + 3, n + n3 - 3, n2 + n4 - 3, -1716314);
        }
        if (font != null) {
            guiGraphicsExtractor.text(font, string, n + 7, n2 + 6, -12966894, false);
        }
    }

    public static void openModdedScreen(Object object, int n) {
        try {
            CACHED_CLIENT = object;
            Component component = (Component)ApertureOrbRenderer.makeComponent("Primeval Aperture");
            ApertureOrbScreen apertureOrbScreen = new ApertureOrbScreen(component, n);
            try {
                Class<?> clazz = Class.forName("net.minecraft.client.gui.screens.Screen");
                object.getClass().getMethod("setScreen", clazz).invoke(object, new Object[]{apertureOrbScreen});
            }
            catch (Throwable throwable) {
                Object object2 = object.getClass().getField("gui").get(object);
                Class<?> clazz = Class.forName("net.minecraft.client.gui.screens.Screen");
                object2.getClass().getMethod("setScreen", clazz).invoke(object2, new Object[]{apertureOrbScreen});
            }
        }
        catch (Throwable throwable) {
            // empty catch block
        }
    }

    public static void addButton(Object object, String string, int n, int n2, int n3, int n4, int n5) {
        try {
            Object object2 = ApertureOrbRenderer.makeComponent(string);
            Class<?> clazz = Class.forName("net.minecraft.client.gui.components.Button$OnPress");
            Object object3 = Proxy.newProxyInstance(clazz.getClassLoader(), new Class[]{clazz}, new ApertureOrbRenderer(n5));
            Class<?> clazz2 = Class.forName("net.minecraft.client.gui.components.Button");
            Class<?> clazz3 = Class.forName("net.minecraft.network.chat.Component");
            Object object4 = clazz2.getMethod("builder", clazz3, clazz).invoke(null, object2, object3);
            object4.getClass().getMethod("bounds", Integer.TYPE, Integer.TYPE, Integer.TYPE, Integer.TYPE).invoke(object4, n, n2, n3, n4);
            Object object5 = object4.getClass().getMethod("build", new Class[0]).invoke(object4, new Object[0]);
            if (ADD_WIDGET_METHOD == null) {
                Method[] methodArray = Class.forName("net.minecraft.client.gui.screens.Screen").getDeclaredMethods();
                for (int i = 0; i < methodArray.length; ++i) {
                    Method method = methodArray[i];
                    if (!method.getName().equals("addRenderableWidget")) continue;
                    method.setAccessible(true);
                    ADD_WIDGET_METHOD = method;
                    break;
                }
            }
            ADD_WIDGET_METHOD.invoke(object, object5);
        }
        catch (Throwable throwable) {
            // empty catch block
        }
    }

    public static void ensureScreenFields() throws Throwable {
        if (WIDTH_FIELD == null) {
            Class<?> clazz = Class.forName("net.minecraft.client.gui.screens.Screen");
            Field field = clazz.getDeclaredField("width");
            field.setAccessible(true);
            WIDTH_FIELD = field;
            Field field2 = clazz.getDeclaredField("height");
            field2.setAccessible(true);
            HEIGHT_FIELD = field2;
            Field field3 = clazz.getDeclaredField("font");
            field3.setAccessible(true);
            FONT_FIELD = field3;
        }
    }

    public static void onScreenInit(Object object, int n) {
        try {
            ApertureOrbRenderer.ensureScreenFields();
            int n2 = WIDTH_FIELD.getInt(object) / 2;
            int n3 = HEIGHT_FIELD.getInt(object) / 2;
            ApertureOrbRenderer.addButton(object, "", n2 + -200, n3 + -54, 122, 20, n == 0 ? 10 : 501);
            ApertureOrbRenderer.addButton(object, "", n2 + -200, n3 + -26, 122, 20, n == 0 ? 8 : 502);
            ApertureOrbRenderer.addButton(object, "", n2 + -200, n3 + 2, 122, 20, n == 0 ? 7 : 503);
            ApertureOrbRenderer.addButton(object, "", n2 + -200, n3 + 30, 122, 20, n == 0 ? 901 : 504);
            ApertureOrbRenderer.addButton(object, "", n2 + 78, n3 + -54, 122, 20, n == 0 ? 1 : 505);
            ApertureOrbRenderer.addButton(object, "", n2 + 78, n3 + -26, 122, 20, n == 0 ? 2 : 506);
            ApertureOrbRenderer.addButton(object, "", n2 + 78, n3 + 2, 122, 20, n == 0 ? 3 : 507);
            ApertureOrbRenderer.addButton(object, "", n2 + 78, n3 + 30, 122, 20, n == 0 ? 4 : 508);
            ApertureOrbRenderer.addButton(object, "", n2 + -134, n3 + 72, 128, 20, n == 0 ? 302 : 900);
            ApertureOrbRenderer.addButton(object, "", n2 + 6, n3 + 72, 128, 20, n == 0 ? 999 : 999);
        }
        catch (Throwable throwable) {
            // empty catch block
        }
    }

    public static void onScreenRender(Object object, GuiGraphicsExtractor guiGraphicsExtractor, int n, int n2, int n3) {
        try {
            ApertureOrbRenderer.ensureScreenFields();
            int n4 = guiGraphicsExtractor.guiWidth() / 2;
            int n5 = guiGraphicsExtractor.guiHeight() / 2;
            Font font = (Font)FONT_FIELD.get(object);
            guiGraphicsExtractor.fill(n4 + -222, n5 + -108, n4 + 222, n5 + -100, -13952242);
            guiGraphicsExtractor.fill(n4 + -220, n5 + -106, n4 + 220, n5 + -102, -9747421);
            guiGraphicsExtractor.fill(n4 + -222, n5 + -107, n4 + -216, n5 + -101, -4023496);
            guiGraphicsExtractor.fill(n4 + 216, n5 + -107, n4 + 222, n5 + -101, -4023496);
            guiGraphicsExtractor.fill(n4 + -222, n5 + 100, n4 + 222, n5 + 108, -13952242);
            guiGraphicsExtractor.fill(n4 + -220, n5 + 102, n4 + 220, n5 + 106, -9747421);
            guiGraphicsExtractor.fill(n4 + -222, n5 + 101, n4 + -216, n5 + 107, -4023496);
            guiGraphicsExtractor.fill(n4 + 216, n5 + 101, n4 + 222, n5 + 107, -4023496);
            guiGraphicsExtractor.fill(n4 + -216, n5 + -100, n4 + 216, n5 + 100, -13426672);
            guiGraphicsExtractor.fill(n4 + -213, n5 + -97, n4 + 213, n5 + 97, -2967412);
            guiGraphicsExtractor.fill(n4 + -209, n5 + -93, n4 + 209, n5 + 93, -1650778);
            guiGraphicsExtractor.fill(n4 + -205, n5 + -89, n4 + 205, n5 + 89, -991302);
            guiGraphicsExtractor.fill(n4 + -195, n5 + -73, n4 + 195, n5 + -72, -4678802);
            guiGraphicsExtractor.fill(n4 + -195, n5 + 64, n4 + 195, n5 + 65, -4678802);
            ApertureOrbRenderer.drawApertureGlassOrb(guiGraphicsExtractor, font, n4, n5 - 4, n3);
            if (font != null) {
                guiGraphicsExtractor.text(font, n3 == 0 ? "Primeval Aperture Scroll" : "Gu Refinement Scroll", n4 + -68, n5 + -85, -12966894, false);
            }
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + -200, n5 + -54, 122, 20, n, n2, n3 == 0 ? "Awaken Aperture" : "[R2] Moonglow Gu", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + -200, n5 + -26, 122, 20, n, n2, n3 == 0 ? "Breakthrough +25%" : "[R2] Four Flavors", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + -200, n5 + 2, 122, 20, n, n2, n3 == 0 ? "Meditate (3x)" : "[R2] White Jade Gu", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + -200, n5 + 30, 122, 20, n, n2, n3 == 0 ? "Refinement Page" : "[R2] Blood Moon Gu", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + 78, n5 + -54, 122, 20, n, n2, n3 == 0 ? "[R] Gu Slot 1" : "[R3] Golden Moon", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + 78, n5 + -26, 122, 20, n, n2, n3 == 0 ? "[G] Gu Slot 2" : "[R3] Chainsaw Gu", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + 78, n5 + 2, 122, 20, n, n2, n3 == 0 ? "[V] Gu Slot 3" : "[R3] Sky Canopy Gu", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + 78, n5 + 30, 122, 20, n, n2, n3 == 0 ? "[B] Gu Slot 4" : "[R3] Thunder Wings", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + -134, n5 + 72, 128, 20, n, n2, n3 == 0 ? "Chainsaw Centipede" : "Aperture Page", -13426672);
            ApertureOrbRenderer.drawCultivationCard(guiGraphicsExtractor, font, n4 + 6, n5 + 72, 128, 20, n, n2, n3 == 0 ? "Close Scroll" : "Close Scroll", -13426672);
        }
        catch (Throwable throwable) {
            // empty catch block
        }
    }

    public Object invoke(Object object, Method method, Object[] objectArray) throws Throwable {
        int n = this.buttonActionCode;
        if (n == 900) {
            ApertureOrbRenderer.openModdedScreen(CACHED_CLIENT, 0);
            return null;
        }
        if (n == 901) {
            ApertureOrbRenderer.openModdedScreen(CACHED_CLIENT, 1);
            return null;
        }
        if (n == 999) {
            try {
                Class<?> clazz = Class.forName("net.minecraft.client.gui.screens.Screen");
                CACHED_CLIENT.getClass().getMethod("setScreen", clazz).invoke(CACHED_CLIENT, new Object[]{null});
            }
            catch (Throwable throwable) {
                // empty catch block
            }
            return null;
        }
        ClientKeybindBridge.dispatchAction(CACHED_CLIENT, n);
        return null;
    }
}

