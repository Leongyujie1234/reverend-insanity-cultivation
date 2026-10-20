# Refine [Rank 2] White Jade Gu | Base Success: 22% | Requires: 8 Emeralds + 8 Nether Quartz + 85 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..1 run tellraw @s [{text:"[Gu Refinement] Requires Rank 2 Cultivation to refine [Rank 2] White Jade Gu!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat1 run clear @s minecraft:emerald 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat2 run clear @s minecraft:quartz 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches ..7 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] White Jade Gu! Need: 8 Emeralds + 8 Nether Quartz + 85 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches ..7 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] White Jade Gu! Need: 8 Emeralds + 8 Nether Quartz + 85 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches 8.. if score @s ri_essence matches ..84 run tellraw @s [{text:"[Gu Refinement] Need 85 Primeval Essence to refine [Rank 2] White Jade Gu!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches 8.. if score @s ri_essence matches 85.. run function reverend_insanity:refine/exec_511
