# Reverend Insanity: Cultivation — 26.1.2 (unofficial fixed build)

Unofficial fixed build of the **Reverend Insanity: Cultivation (Rank 1–3)** Fabric mod for **Minecraft 26.1.2**, plus its resource pack.

Built for our SMP and published for easy distribution. **Original mod by "Gu Zhen Ren Inspired Modding Team" (MIT license)** — this repo repackages it with a small client-side fix.

## ⬇️ Download

See [**Releases**](../../releases/latest):

| File | Purpose |
|------|---------|
| `reverend-insanity-cultivation-1.0.0+26.1.2.jar` | The mod. Install on the server (`mods/`) and on clients (`mods/`) for keybinds + modded GUI. |
| `reverend-insanity-resourcepack-26.1.2.zip` | Resource pack (Gu items). Server-side: serve as a resource pack, or add to a Polymer `include_zips` entry. |

## What's fixed vs. the upstream 1.0.0 build

1. **Client crash on `Options → Controls → Key Binds`.** The upstream client bridge looked up `net.minecraft.resources.ResourceLocation`, which no longer exists in 26.x (it is `net.minecraft.resources.Identifier`). The failed lookup silently left the keybind category `null`, and the 7 keybinds were still registered — opening the Key Binds screen then crashed the game (`KeyBindsList$CategoryEntry` NPE, then a render NPE). The rebuilt bridge:
   - resolves `Identifier` / `ResourceLocation` dynamically,
   - registers the `reverend_insanity:cultivation` category via `KeyMapping$Category.register`,
   - registers **no keybinds at all** if no category can be created (so it can never crash the screen again),
   - keeps the in-game handshake and the `/trigger` action path working.
2. **Resource pack**: removed the deprecated `supported_formats` block from `pack.mcmeta` (kills the `pack format 82` fallback warnings and fixes server-side merging / Polymer rejection).

`src/` contains the source of the single patched class (`ClientKeybindBridge`) — a drop-in replacement for the class inside the upstream jar. Everything else is byte-identical to upstream.

## Keybinds (client defaults)

- `R` `G` `V` `B` — activate Gu slot 1–4
- `O` — Primordial Aperture GUI, `P` — Gu Refinement GUI
- `M` — meditate / nurture aperture

## Commands (no client mod needed)

`/trigger ri_action set <n>` — `1`–`4` cast slot, `7` meditate, `8` nurture wall, `10` awaken, `50` aperture, `60` refinement.

## Install

- **Client**: put the `.jar` into `mods/`.
- **Server**: put the `.jar` into `mods/`; serve the resource pack from the release (or your own merged pack).

## Credits & license

- Original mod: *Gu Zhen Ren Inspired Modding Team* — MIT.
- This fix build: repackaged binary + patched class source, also MIT. See [LICENSE](LICENSE).
