// Recovered with CFR 0.152 from reverend-insanity-cultivation-1.0.0+26.1.2.jar (fix4 build, 2026-10-17). See CHANGELOG.md.
/*
 * Decompiled with CFR 0.152.
 * 
 * Could not load the following classes:
 *  net.minecraft.client.gui.GuiGraphicsExtractor
 *  net.minecraft.client.gui.screens.Screen
 *  net.minecraft.network.chat.Component
 */
package com.reverendinsanity.client;

import com.reverendinsanity.client.ApertureOrbRenderer;
import net.minecraft.client.gui.GuiGraphicsExtractor;
import net.minecraft.client.gui.screens.Screen;
import net.minecraft.network.chat.Component;

public class ApertureOrbScreen
extends Screen {
    public int mode;

    public ApertureOrbScreen(Component component, int n) {
        super(component);
        this.mode = n;
    }

    protected void init() {
        super.init();
        ApertureOrbRenderer.onScreenInit((Object)this, this.mode);
    }

    public void extractRenderState(GuiGraphicsExtractor guiGraphicsExtractor, int n, int n2, float f) {
        super.extractRenderState(guiGraphicsExtractor, n, n2, f);
        guiGraphicsExtractor.nextStratum();
        ApertureOrbRenderer.onScreenRender((Object)this, guiGraphicsExtractor, n, n2, this.mode);
    }

    public boolean isPauseScreen() {
        return false;
    }
}

