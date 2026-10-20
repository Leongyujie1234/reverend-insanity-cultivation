# Refine [Rank 2] Moonglow Gu | Base Success: 25% | Requires: 8 Amethyst Shards + 3 Diamonds + 75 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..1 run tellraw @s [{text:"[Gu Refinement] Requires Rank 2 Cultivation to refine [Rank 2] Moonglow Gu!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat1 run clear @s minecraft:amethyst_shard 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat2 run clear @s minecraft:diamond 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches ..7 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] Moonglow Gu! Need: 8 Amethyst Shards + 3 Diamonds + 75 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches ..2 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] Moonglow Gu! Need: 8 Amethyst Shards + 3 Diamonds + 75 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches 3.. if score @s ri_essence matches ..74 run tellraw @s [{text:"[Gu Refinement] Need 75 Primeval Essence to refine [Rank 2] Moonglow Gu!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches 3.. if score @s ri_essence matches 75.. run function reverend_insanity:refine/exec_509
