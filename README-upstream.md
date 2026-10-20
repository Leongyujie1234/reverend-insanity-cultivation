# Reverend Insanity: Cultivation Mod (Minecraft Java Edition 26.1.2 Fabric)

A lore-faithful **Reverend Insanity (Gu Zhen Ren)** Rank 1–3 Cultivation & Gu Refinement mod for **Minecraft Java Edition 26.1.2** on Fabric.

## Key Features
- **Non-Villager `Master` Elder NPC & Awakening Trial**: Seek out **Master** (custom Gu Master Elder texture with a golden-jade starlight aura), complete his trial (**slay 10 creatures + bring 8 Amethyst Shards, 4 Emeralds, and 4 Gold Ingots**), and receive **Hope Gu** + **5 Primeval Stones**.
- **Exact Individual Aptitude Percentage (`20%–99%`)**: Right-clicking **Hope Gu** consumes it and rolls a permanent, immutable Aptitude percentage (`Grade D: 20–39%`, `Grade C: 40–59%` like Fang Yuan's `44%`, `Grade B: 60–79%`, `Grade A: 80–99%`), capping your Primeval Sea capacity.
- **2D Parchment Split-Panel Interface (`[O]` Gu Worms & `[P]` Refinement)**:
  - **2 Top Tabs Only (`Gu Worms` & `Refinement`)**: Your Aperture starts with **0 Gu Worms**—only Gu Worms you have refined appear in the `Gu Worms` tab.
  - **Scrollable Gu Grid**: Scroll through slots using the **Mouse Wheel** or by clicking the right-hand scrollbar.
  - **Hard Material-Based Refinement with High Failure Rate**: Each of the 19 Gu Worms requires specific materials and Primeval Essence, with a `12%–38%` base success rate (`62%–88%` chance of failure!). Carry **Diamond Block (`+15%`)**, **Emerald Block (`+20%`)**, or **Nether Star (`+50%`)** in your inventory as a catalyst to boost refinement success.
- **Slow Natural Primeval Sea Regeneration & Self-Healing Aperture Walls**: Natural regeneration ticks once every **6 seconds**, while Aperture Walls heal **`-4%/s`**, requiring Primeval Stones to break through in one concentrated assault.

## Admin Commands (`/function reverend_insanity:admin/...`)
- `/function reverend_insanity:admin/help` — List all admin commands
- `/function reverend_insanity:admin/clear_cultivation` — Wipe your cultivation, Aptitude, and Gu back to mortal
- `/execute as <player> run function reverend_insanity:admin/clear_cultivation` — Wipe a specific player's cultivation
- `/function reverend_insanity:admin/clear_cultivation_target` — Wipe the nearest player's cultivation
- `/function reverend_insanity:admin/purge_cultivation_target` — Wipe all players' cultivation and persistent storage
- `/function reverend_insanity:admin/reroll_aptitude` — Force-reroll exact Aptitude percentage (`20%–99%`)
- `/function reverend_insanity:admin/max_cultivation` — Grant Rank 3 Peak Stage, `99%` Grade A Aptitude, and all 19 Gu Worms
- `/function reverend_insanity:admin/refill_essence` — Refill Primeval Sea to maximum capacity
