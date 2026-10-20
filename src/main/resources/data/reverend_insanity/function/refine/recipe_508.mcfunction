# Refine [Rank 1] Vitality Leaf Gu | Base Success: 35% | Requires: 3 Glistering Melon + 4 Emeralds + 18 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..0 run tellraw @s [{text:"[Gu Refinement] Requires Rank 1 Cultivation to refine [Rank 1] Vitality Leaf Gu!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. store result score @s ri_mat1 run clear @s minecraft:glistering_melon_slice 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. store result score @s ri_mat2 run clear @s minecraft:emerald 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches ..2 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 1] Vitality Leaf Gu! Need: 3 Glistering Melon + 4 Emeralds + 18 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 3.. if score @s ri_mat2 matches ..3 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 1] Vitality Leaf Gu! Need: 3 Glistering Melon + 4 Emeralds + 18 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 3.. if score @s ri_mat2 matches 4.. if score @s ri_essence matches ..17 run tellraw @s [{text:"[Gu Refinement] Need 18 Primeval Essence to refine [Rank 1] Vitality Leaf Gu!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 3.. if score @s ri_mat2 matches 4.. if score @s ri_essence matches 18.. run function reverend_insanity:refine/exec_508
