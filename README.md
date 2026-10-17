# Reverend Insanity: Cultivation — 26.1.2 (unofficial fixed build)

Unofficial fixed + enhanced build of the **Reverend Insanity: Cultivation (Rank 1–3)** Fabric mod for **Minecraft 26.1.2**, plus its resource pack.

Built for our SMP and published for easy distribution. **Original mod by "Gu Zhen Ren Inspired Modding Team" (MIT license)** — this repo repackages it with fixes, a custom orb UI, a multi-tick Chainsaw engine and a few admin conveniences.

⭐ Every single change vs. the upstream build is audited in **[CHANGELOG.md](CHANGELOG.md)** (29 jar entries + 1 pack fix, everything else byte-identical).

## 📥 Download

See [**Releases**](../../releases/latest):

| File | Purpose |
|------|---------|
| `reverend-insanity-cultivation-1.0.0+26.1.2.jar` | The mod. Install on the server (`mods/`) and on clients (`mods/`) for keybinds + the modded UI. |
| `reverend-insanity-resourcepack-26.1.2.zip` | Resource pack (Gu items). Server-side: serve as a resource pack, or add to a Polymer `include_zips` entry. |

## What's new in fix4

- **Immortal Aperture orb UI (client).** `O` / `P` open a real custom screen — animated ringed glass orb, cultivation cards and clickable action buttons (cast slots, meditate, breakthrough, awakening, refinement recipes, chainsaw, page switch, close). Every button sends the same `trigger ri_action set <n>` commands as the hotkeys — works on any server running the jar, no custom packets.
- **Chainsaw Golden Centipede engine.** Physical multi-tick whip/buzzsaw (`block_display` segments) that pulls and shreds nearby enemies for 4 seconds; triggered by the Chainsaw Gu.
- **17 Gu casts reworked** — layered dust VFX (dark-smoke plume, blood-moon arcs, gold crescent + flames, viridian burst, …); balance values untouched.
- **Client bridge v4** — proxy tick listener, Fabric `KeyMappingHelper` registration, one-shot diagnostics (plus all fix1–fix3 repairs below).

## What's fixed vs. the upstream 1.0.0 build (fix1–fix3)

1. **Client bridge rebuilt (`ClientKeybindBridge`) — fixes two separate bugs:**
   - **Crash on `Options → Controls → Key Binds`.** The upstream bridge looked up `net.minecraft.resources.ResourceLocation`, which no longer exists in 26.x (it is `net.minecraft.resources.Identifier`). The failed lookup left the keybind category `null` while the 7 keybinds were still registered → opening the Key Binds screen crashed the game (`KeyBindsList$CategoryEntry` NPE, then a render NPE). The rebuilt bridge resolves `Identifier` / `ResourceLocation` dynamically, registers the `reverend_insanity:cultivation` category via `KeyMapping$Category.register`, and registers **no keybinds at all** if no category can be created (so it can never crash the screen again).
   - **Dead hotkeys (`R G V B O P M` did nothing, no server handshake).** The first rebuild hooked the client tick event through Fabric's package-private event implementation class, so registration threw `IllegalAccessException` — every keybind press and the handshake were silently swallowed. The hook now registers through the public `Event` superclass; the handshake (`action 99`) and all keybinds work again.
2. **`exec_104` (Black Boar Gu) failed to load.** The function contained an invalid particle ID (`minecraft:Large_smoke` — resource IDs must be lowercase), so the whole function refused to load and the cast died at runtime. Fixed to `minecraft:large_smoke`.
3. **The remaining 5 broken casts are repaired inside the jar** — `exec_101` (Moonlight), `exec_201` (Moonglow), `exec_204` (Blood Moon), `exec_301` (Golden Moon), `exec_302` (Chainsaw). Their damage/effect application was rewritten so the functions load and hit every target in the blast; upstream versions refused to load (clients logged 6 failed functions, now zero).
4. **VFX overhaul — Moonlight & Moonglow Gu.** Moonlight throws a curved **pale-azure energy crescent** (layered dust arc + spark tips + slash) instead of a blue `soul_fire_flame` spray. Moonglow throws a bigger **sapphire piercing crescent** with a travelling energy streak along its path. (Both kept unchanged in fix4.)
5. **Resource pack**: removed the deprecated `supported_formats` block from `pack.mcmeta` (kills the `pack format 82` fallback warnings and fixes server-side merging / Polymer rejection).

## Added: admin cultivation commands

Operator (permission level 2) only.

| Command | What it does |
|---|---|
| `/function reverend_insanity:admin/clear_cultivation_target {target:"PlayerName"}` | Resets all cultivation progress: rank, stage, aptitude, essence, wall, meditation, bound slots (back to defaults), pending triggers. Works for **offline** players too. |
| `/function reverend_insanity:admin/purge_cultivation_target {target:"PlayerName"}` | Same reset **plus deletes every mod item** (all Gu worms, Primeval Stones, Aperture Talisman) from the player. Item removal requires the player to be **online**. |
| `/execute as <player> run function reverend_insanity:admin/clear_cultivation` | Resets only the given player's progress (no item removal). |

After a reset the player re-awakens with a Hope Gu. After a purge they can rebuild from scratch with `/trigger ri_starter`.

## Sources

`src/` contains the sources of everything changed vs. upstream: the client classes (`ClientKeybindBridge` v4, `ApertureOrbRenderer`, `ApertureOrbScreen` — recovered with CFR), all 26 changed/added functions (19 reworked casts including the new `chainsaw_tick`, `load` / `tick` / `register_mod_client`, admin functions). Everything else is byte-identical to upstream.

## Keybinds (client defaults)

- `R` `G` `V` `B` — activate Gu slot 1–4
- `O` — Immortal Aperture orb screen (custom UI) · `P` — Gu Refinement page
- `M` — meditate / nurture aperture

## Commands (no client mod needed)

`/trigger ri_action set <n>` — `1`–`4` cast slot, `7` meditate, `8` nurture wall, `10` awaken, `50` aperture, `60` refinement.

## Install

- **Client**: put the `.jar` into `mods/`.
- **Server**: put the `.jar` into `mods/`; serve the resource pack from the release (or your own merged pack).

## Credits & license

- Original mod: *Gu Zhen Ren Inspired Modding Team* — MIT.
- This fix build: repackaged binary + patched sources, also MIT. See [LICENSE](LICENSE).
