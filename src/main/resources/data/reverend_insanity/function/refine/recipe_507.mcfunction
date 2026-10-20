# Refine [Rank 1] Stealth Scales Gu | Base Success: 35% | Requires: 4 Prismarine Shards + 4 Ink Sacs + 18 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..0 run tellraw @s [{text:"[Gu Refinement] Requires Rank 1 Cultivation to refine [Rank 1] Stealth Scales Gu!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. store result score @s ri_mat1 run clear @s minecraft:prismarine_shard 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. store result score @s ri_mat2 run clear @s minecraft:ink_sac 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches ..3 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 1] Stealth Scales Gu! Need: 4 Prismarine Shards + 4 Ink Sacs + 18 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches ..3 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 1] Stealth Scales Gu! Need: 4 Prismarine Shards + 4 Ink Sacs + 18 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches 4.. if score @s ri_essence matches ..17 run tellraw @s [{text:"[Gu Refinement] Need 18 Primeval Essence to refine [Rank 1] Stealth Scales Gu!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches 4.. if score @s ri_essence matches 18.. run function reverend_insanity:refine/exec_507
