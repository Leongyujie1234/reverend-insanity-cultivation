# Change Report — unofficial fixed build

Audit of **every change** in this fix build relative to the upstream
`reverend-insanity-cultivation-1.0.0+26.1.2.jar` (original mod by *Gu Zhen Ren Inspired Modding Team*, MIT).

**10 jar entries changed/added** (1 class + 9 functions) out of 196 — plus 1 resource pack fix.
Everything else (all other functions, items/components, models, textures, sounds and classes) is byte-identical to upstream.

---

## 1. `com/reverendinsanity/client/ClientKeybindBridge.class` — rewritten (client)

The upstream class had two version-compat bugs, found and fixed across two rounds:

| # | Bug | Symptom | Root cause | Fix |
|---|-----|---------|------------|-----|
| 1.1 | **Key Binds screen crash** (fix1) | Opening `Options → Controls → Key Binds` crashed the game | Upstream looked up `net.minecraft.resources.ResourceLocation` — renamed to `Identifier` in 26.x. The lookup failed, the keybind category stayed `null`, but the 7 keybinds were still registered → `KeyBindsList$CategoryEntry` NPE on open | `Identifier`-first dynamic lookup (ResourceLocation fallback); `KeyMapping$Category.register` located reflectively; if no category can be created → **register no keybinds at all** (screen can never crash again); one-time init; errors caught, never thrown |
| 1.2 | **Dead hotkeys + no handshake** (fix3) | `R G V B` (cast), `O`/`P` (GUIs), `M` (meditate) did nothing — and the mod's server handshake never ran | The first fix hooked the client tick event via `event.getClass().getMethod("register", ...)`. Fabric's event implementation class (`ArrayBackedEvent`) is *package-private* → `IllegalAccessException` at registration → the tick listener never registered, so every keypress and the `action 99` handshake were silently swallowed | Register through the **public `net.fabricmc.fabric.api.event.Event` superclass**; resilient `player` / `connection` / `sendCommand` resolution (public lookup, then declared-fields fallback); one-shot diagnostics instead of silence; proxy hardening (`onEndTick` only + `equals`/`hashCode` guards) |

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

## Verification performed

- **JVM tests against the real 26.1.2 classes**: keybind category creation; tick hook registration (Fabric event handler list went 0 → 1 listener); dispatch-chain mock emitted `trigger ri_action set 50 / 60 / 99 / 1` (exactly the commands the server expects).
- **Reflection probe on real client classes**: `Minecraft.player`, `LocalPlayer.connection`, `ClientPacketListener.sendCommand(String)` — all public → dispatch chain valid for the live game.
- **Particle options validated against the client jar codec**: `dust.color` accepts int or `[r,g,b]` float list, `scale` range 0.01–4.0 — the new VFX values are in range.
- **In-game (server log)**: clean boot after fix3, zero `Failed to load function` errors; client handshake (`set value to 99`) and `O` key (`set value to 50`) both received → hotkey path works end-to-end.
- **Zip integrity**: `testzip` clean, all 196 entries preserved (only the listed entries differ).

## Build hashes

| Artifact | Size (bytes) | SHA-256 |
|----------|--------------|---------|
| jar — fix1 | 90,728 | `72ff84b738016c0d89b0bb4e2d1a42912e29eab25ec2a67e766eb47abf6a10bf` |
| jar — fix2 | 92,678 | `cde34fa640706e5153c48d9c4ebc5329b03ba517e66b24fc7eb99466cebc7411` |
| jar — fix3 (latest) | 94,272 | `2e30e654e80ee533a9a02d3b57a0bb98b0dfc3b65d40d96b8804419c5ce010b1` |
| resource pack | 26,501 | `b55be61a6e29829de8ddc3144bde8fa85147b0f714756de12a659a1dd8afcc16` |

## Rebuild notes

- **Client class**: compiles standalone (`javac --release 17`) — it references only `java.lang.reflect` (all Minecraft/Fabric access is by name), so no classpath is needed. Output goes to `com/reverendinsanity/client/ClientKeybindBridge.class`.
- **Functions**: plain `.mcfunction` files under `data/reverend_insanity/function/` (singular `function`).
- Sources for every changed file are in [`src/`](src/).
