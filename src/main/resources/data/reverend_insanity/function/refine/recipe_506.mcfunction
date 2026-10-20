# Refine [Rank 1] Little Light Gu | Base Success: 38% | Requires: 6 Glowstone Dust + 4 Amethyst Shards + 15 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..0 run tellraw @s [{text:"[Gu Refinement] Requires Rank 1 Cultivation to refine [Rank 1] Little Light Gu!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. store result score @s ri_mat1 run clear @s minecraft:glowstone_dust 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. store result score @s ri_mat2 run clear @s minecraft:amethyst_shard 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches ..5 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 1] Little Light Gu! Need: 6 Glowstone Dust + 4 Amethyst Shards + 15 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 6.. if score @s ri_mat2 matches ..3 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 1] Little Light Gu! Need: 6 Glowstone Dust + 4 Amethyst Shards + 15 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 6.. if score @s ri_mat2 matches 4.. if score @s ri_essence matches ..14 run tellraw @s [{text:"[Gu Refinement] Need 15 Primeval Essence to refine [Rank 1] Little Light Gu!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 6.. if score @s ri_mat2 matches 4.. if score @s ri_essence matches 15.. run function reverend_insanity:refine/exec_506
