# Change Report — unofficial fixed build

Audit of **every change** in this fix build relative to the upstream
`reverend-insanity-cultivation-1.0.0+26.1.2.jar` (original mod by *Gu Zhen Ren Inspired Modding Team*, MIT).

**29 jar entries changed/added** (3 client classes + 26 functions) out of 199 — plus 1 resource pack fix.
Everything else (all other functions, items/components, models, textures, sounds and classes) is byte-identical to upstream.

Sections 1–4 audit the fix1–fix3 repairs. Section 5 covers the fix4 feature build: the Immortal Aperture orb UI (client) and the multi-tick Chainsaw Golden Centipede engine.

---

## 1. `com/reverendinsanity/client/ClientKeybindBridge.class` — rewritten (client)

The upstream class had two version-compat bugs, found and fixed across two rounds:

| # | Bug | Symptom | Root cause | Fix |
|---|-----|---------|------------|-----|
| 1.1 | **Key Binds screen crash** (fix1) | Opening `Options → Controls → Key Binds` crashed the game | Upstream looked up `net.minecraft.resources.ResourceLocation` — renamed to `Identifier` in 26.x. The lookup failed, the keybind category stayed `null`, but the 7 keybinds were still registered → `KeyBindsList$CategoryEntry` NPE on open | `Identifier`-first dynamic lookup (ResourceLocation fallback); `KeyMapping$Category.register` located reflectively; if no category can be created → **register no keybinds at all** (screen can never crash again); one-time init; errors caught, never thrown |
| 1.2 | **Dead hotkeys + no handshake** (fix3) | `R G V B` (cast), `O`/`P` (GUIs), `M` (meditate) did nothing — and the mod's server handshake never ran | The first fix hooked the client tick event via `event.getClass().getMethod("register", ...)`. Fabric's event implementation class (`ArrayBackedEvent`) is *package-private* → `IllegalAccessException` at registration → the tick listener never registered, so every keypress and the `action 99` handshake were silently swallowed | Register through the **public `net.fabricmc.fabric.api.event.Event` superclass**; resilient `player` / `connection` / `sendCommand` resolution (public lookup, then declared-fields fallback); one-shot diagnostics instead of silence; proxy hardening (`onEndTick` only + `equals`/`hashCode` guards) |
| 1.3 | **Custom UI integration + hardening** (fix4) | — (feature) | — | Tick listener is now a `java.lang.reflect.Proxy` implementing `ClientTickEvents$EndTick`; keybinds go through Fabric's `KeyMappingHelper` (`fabric-key-mapping-api-v1`) with the legacy `KeyMapping` constructor as fallback; `dispatchAction` routes action codes through `ApertureOrbRenderer.interceptAction` (see §5) so `O`/`P` open the new client screen locally and re-send the `action 99` handshake; dispatch error prints capped at 4 |

## 2. Gu cast functions (server datapack inside the jar)

| File | Change | Why |
|------|--------|-----|
| `cast/exec_104.mcfunction` | `minecraft:Large_smoke` → `minecraft:large_smoke` (fix2) | Invalid particle ID (uppercase) → the whole function refused to load → Black Boar Gu cast dead |
| `cast/exec_101.mcfunction` | damage/effect lines rewritten + **new crescent VFX** (fix3) | Upstream function failed to load on 26.1.2; visual reworked from `soul_fire_flame` spray to a curved pale-azure energy crescent (7-point dust arc + spark tips + slash + trail) |
| `cast/exec_201.mcfunction` | damage/effect lines rewritten + **new crescent VFX** (fix3) | Same load fix; Moonglow blade: large sapphire crescent + piercing energy streak down the cast path |
| `cast/exec_204.mcfunction` | damage/effect lines rewritten (fix3) | Upstream function failed to load (Blood Moon) — repair folded into the jar |
| `cast/exec_301.mcfunction` | damage/effect lines rewritten (fix3) | Same (Golden Moon) |
| `cast/exec_302.mcfunction` | damage/effect lines rewritten (fix3) | Same (Chainsaw Golden Centipede) |

> Casts 101/201/204/301/302 were first repaired via a world datapack override; fix3 folds identical repairs **into the jar**, so clients no longer log `Failed to load function` errors and the jar is self-contained.
> In fix4, `exec_101` / `exec_201` keep these crescent visuals byte-identical; the other 17 slot casts were reworked further — see §5.

## 3. Admin functions — added (fix2)

Operator (permission level 2) only.

| File | Invocation | Behavior |
|------|------------|----------|
| `admin/clear_cultivation.mcfunction` | `/execute as <player> run function reverend_insanity:admin/clear_cultivation` | Resets the given player's cultivation progress |
| `admin/clear_cultivation_target.mcfunction` | `/function reverend_insanity:admin/clear_cultivation_target {target:"Name"}` | Name-keyed reset; works for **offline** players (rank, stage, aptitude, essence, wall, meditate, bound slots, pending triggers) |
| `admin/purge_cultivation_target.mcfunction` | `/function reverend_insanity:admin/purge_cultivation_target {target:"Name"}` | Reset + deletes every mod item from the player (target must be **online**) |

## 4. Resource pack (release + server)

- Removed the deprecated `supported_formats` block from `pack.mcmeta` → no more `pack format 82` fallback warnings; fixes server-side merging / Polymer rejection. **No art or asset changes.**

---

## 5. fix4 feature build — Immortal Aperture orb UI + Chainsaw engine

### 5.1 New client classes (sources in `src/`, recovered with CFR 0.152)

| Class | What it does |
|-------|--------------|
| `ApertureOrbScreen` | Real `net.minecraft.client.gui.screens.Screen` subclass; `mode` 0 = Immortal Aperture page, 1 = Gu Refinement page; delegates `init()` → `ApertureOrbRenderer.onScreenInit`, `extractRenderState(...)` → `guiGraphicsExtractor.nextStratum()` + `ApertureOrbRenderer.onScreenRender`; not a pause screen |
| `ApertureOrbRenderer` | Draws the whole UI with primitive `fill` strata: ringed glass orb with rotating highlight, title bar, cultivation cards (hover highlight); builds buttons reflectively (`Button.builder(Component, OnPress)` → `bounds` → `build` → `Screen.addRenderableWidget`) where every button is a `Button$OnPress` proxy; `interceptAction(client, n)` maps `5` → open aperture screen, `6` → open refinement screen (returns `99` so the mod-client handshake re-fires), everything else passes through |

Button action codes (all dispatched via the same `trigger ri_action set <n>` path as the hotkeys — no custom packets):
`1–4` cast slots · `7` meditate · `8` wall +25% · `10` awaken · `302` Chainsaw Centipede · `501–508` refinement recipes · `900`/`901` switch page · `999` close.

### 5.2 Chainsaw Golden Centipede — multi-tick engine (datapack)

- **New**: `cast/chainsaw_tick.mcfunction` — physically animated whip/buzzsaw: `block_display` segments re-summoned every tick (killed each tick, respawned along the swing arc), dust + crit particles, pulls and shreds nearby entities (`damage … by @p`), evaporates when the counter hits 0.
- **New objective** `ri_chainsaw_t` (declared in `load.mcfunction`); `tick.mcfunction` runs the engine for every player with `ri_chainsaw_t ≥ 1`.
- `exec_302.mcfunction` now sets `ri_chainsaw_t = 80` (4 seconds) + grindstone sound on cast.

### 5.3 Reworked cast VFX (17 functions)

`exec_102–108`, `exec_202–207`, `exec_301–304` rebuilt with layered `minecraft:dust` visuals (effect/balance values unchanged), e.g.:

- `exec_104` — dark-smoke plume + crit sparks
- `exec_204` — crimson blood-moon arcs sweeping forward
- `exec_206` — viridian glow-burst ring
- `exec_301` — gold crescent + rising flame tongues

### 5.4 Other function updates

- `load.mcfunction` — new `ri_chainsaw_t` objective.
- `tick.mcfunction` — chainsaw loop hook.
- `register_mod_client.mcfunction` — one-shot guard (`unless score … matches 1`) + updated message ("Immortal Aperture Glass Orb UI & Hotkeys … Active!").

---

## Verification performed

- **JVM tests against the real 26.1.2 classes (fix1–fix4)**: keybind category creation; tick hook registration (Fabric event handler list went 0 → 1 listener); dispatch-chain mock emitted `trigger ri_action set 50 / 60 / 99 / 1` (fix3) and `99 / 1 / 10 / 501` (fix4).
- **Reflection probe on real client classes**: `Minecraft.player`, `LocalPlayer.connection`, `ClientPacketListener.sendCommand(String)` — all public → dispatch chain valid for the live game.
- **Particle options validated against the client jar codec**: `dust.color` accepts int or `[r,g,b]` float list, `scale` range 0.01–4.0 — the new VFX values are in range.
- **In-game (server log, fix3)**: clean boot, zero `Failed to load function` errors; client handshake (`set value to 99`) and `O` key (`set value to 50`) both received → hotkey path works end-to-end.
- **fix4 static audit**: zero uppercase/invalid resource IDs across all 199 functions; every `net.minecraft` class/member referenced by the new client classes verified present in the real 26.1.2 client jar (`Font`, `GuiGraphicsExtractor.nextStratum/fill/text/guiWidth/guiHeight`, `Screen.width/height/font` fields, `Screen.addRenderableWidget`, `Screen.extractRenderState`, `Button.builder/bounds/build`, `Button$OnPress`, `Component.literal`).
- **fix4 JVM tests**: keybind category ready; tick hook registered (`handlers 0 → 1`, `jdk.proxy` listener); dispatch mock emitted `trigger ri_action set 99 / 1 / 10 / 501`; `interceptAction(5) = 99` (opens orb screen), `interceptAction(7) = 7` (passthrough). Recovered class sources compile clean (`javac --release 17` against the client jar).
- **fix4 deployment**: server + client jars byte-identical to the release jar; world datapack overrides (`exec_101/201/204/301/302/104`) synced to the build's own versions so nothing shadows the new content.
- **Zip integrity**: `testzip` clean.

## Build hashes

| Artifact | Size (bytes) | SHA-256 |
|----------|--------------|---------|
| jar — fix1 | 90,728 | `72ff84b738016c0d89b0bb4e2d1a42912e29eab25ec2a67e766eb47abf6a10bf` |
| jar — fix2 | 92,678 | `cde34fa640706e5153c48d9c4ebc5329b03ba517e66b24fc7eb99466cebc7411` |
| jar — fix3 | 94,272 | `2e30e654e80ee533a9a02d3b57a0bb98b0dfc3b65d40d96b8804419c5ce010b1` |
| jar — fix4 (latest) | 101,909 | `9cdf91ca457bd20d43880ffdf1d10f21e9ff80a832846350e5baaf9b3e52e828` |
| resource pack | 26,501 | `b55be61a6e29829de8ddc3144bde8fa85147b0f714756de12a659a1dd8afcc16` |

## Rebuild notes

- **Client classes**: `ClientKeybindBridge`, `ApertureOrbRenderer`, `ApertureOrbScreen`. The bridge compiles standalone (all Minecraft/Fabric access is by name); the orb classes need the 26.1.2 client jar on the classpath (they import `Font` / `GuiGraphicsExtractor` / `Component`).
- **Recovered sources**: the fix4 client classes were decompiled with CFR 0.152 from the build jar. The renderer's original bytecode throws checked exceptions directly (sneaky-throws) — the recovered source declares `throws Throwable` on `makeComponent` / `ensureScreenFields` so it compiles; all call sites already catch `Throwable`.
- **Functions**: plain `.mcfunction` files under `data/reverend_insanity/function/` (singular `function`).
- Sources for every changed file are in [`src/`](src/).
