# Reverend Insanity: Cultivation Mod (Minecraft Java Edition 26.1.2 Fabric)

A lore-faithful **Reverend Insanity (Gu Zhen Ren)** Rank 1–3 Cultivation & Gu Refinement mod for **Minecraft Java Edition 26.1.2** on Fabric.

## Key Features
- **Bottom-Left RPG Status HUD (Cultivators Only & Auto-Blurs in Menus)**:
  - Positioned in the **bottom-left corner** of the screen (`x = 8, y = sh - 54`).
  - **Only visible while cultivating**: Mortals (or players whose cultivation was wiped via admin commands) see no HUD and cannot open the Aperture (`O`) or Refinement (`P`) interfaces until they awaken with **Hope Gu**.
  - **Background Blur**: Automatically blurs/frosts into the background whenever you open any GUI (Chest, Inventory, Primeval Aperture, Gu Refinement Crucible, or Ancient Recipe Book).
- **Canon Aptitude Percentages (`20%–99%`) Synced Live from Server**:
  - Awakening with **Hope Gu** rolls your permanent innate Primeval Sea ceiling from `20%` to `99%`:
    - **Grade D**: `20%–39%`
    - **Grade C**: `40%–59%` (in canon, Fang Yuan awakened with `44%` Grade C)
    - **Grade B**: `60%–79%`
    - **Grade A**: `80%–99%`
- **Three Distinct Custom Interfaces**:
  1. **Primeval Aperture (`Key O`)**: Warm Daoist parchment & dark-wood interface with a large reactive glass Aperture Orb, Realm/Stage/Aptitude readout, Wall & Essence bars, and the `Assault Aperture Wall` breakthrough button.
  2. **Gu Refinement Crucible (`Key P`)**: Dark obsidian-slate & antique bronze **Crafting-Table style `3x3` Crucible** that does **not** spoil recipes. Place materials into the `3x3` grid and click `Refine Gu` to test your formula!
  3. **Ancient Gu Recipe Books (Traded with Librarian Villagers)**: Level up or trade with **Librarian Villagers** to buy custom **Refinement Recipe Books** (`Refinement Recipe: <Gu Name>`). Right-clicking a Recipe Book opens a custom double-page silk-bound tome showing the exact `3x3` Crucible diagram. **Vanilla players without the mod client cannot open Recipe Books at all.**

## Admin Commands Reference

All admin commands are built into the `reverend_insanity:admin/*` namespace (requires Operator permission level 2+):

| Command | Description |
| :--- | :--- |
| `/function reverend_insanity:admin/help` | Displays all available Reverend Insanity admin commands in chat. |
| `/function reverend_insanity:admin/clear_cultivation` | Wipes **your own** cultivation, resets `ri_awakened` to `0`, removes all Gu Worms, and hides the Bottom-Left HUD, Aperture UI, and Refinement UI. |
| `/execute as <PlayerName> run function reverend_insanity:admin/clear_cultivation` | Wipes a **specific player's** cultivation and resets them back to a mortal. |
| `/function reverend_insanity:admin/clear_cultivation_target` | Wipes the **nearest player's** cultivation. |
| `/function reverend_insanity:admin/purge_cultivation_target` | Wipes **all players'** cultivation across the server and resets persistent storage. |
| `/function reverend_insanity:admin/reroll_aptitude` | Rerolls your exact Aptitude percentage (`20%–99%`, Grade D–A) and updates your Primeval Sea ceiling immediately. |
| `/function reverend_insanity:admin/max_cultivation` | Grants **Rank 3 Peak Stage (White Silver)**, **`99%` Grade A Aptitude**, full Primeval Essence, and all 19 Rank 1–3 Gu Worms. |
| `/function reverend_insanity:admin/refill_essence` | Instantly refills your Primeval Sea to `100%` of your current maximum capacity. |
| `/function reverend_insanity:admin/give_all_recipes` | Grants all **19 Gu Refinement Recipe Books** (`Refinement Recipe: Moonlight Gu` through `Thunder Wings Gu`). |
