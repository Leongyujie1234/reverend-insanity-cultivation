# Refine [Rank 1] Liquor Worm | Base Success: 38% | Requires: 3 Fermented Spider Eyes + 6 Sugar + 15 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..0 run tellraw @s [{text:"[Gu Refinement] Requires Rank 1 Cultivation to refine [Rank 1] Liquor Worm!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. store result score @s ri_mat1 run clear @s minecraft:fermented_spider_eye 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. store result score @s ri_mat2 run clear @s minecraft:sugar 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches ..2 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 1] Liquor Worm! Need: 3 Fermented Spider Eyes + 6 Sugar + 15 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 3.. if score @s ri_mat2 matches ..5 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 1] Liquor Worm! Need: 3 Fermented Spider Eyes + 6 Sugar + 15 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 3.. if score @s ri_mat2 matches 6.. if score @s ri_essence matches ..14 run tellraw @s [{text:"[Gu Refinement] Need 15 Primeval Essence to refine [Rank 1] Liquor Worm!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 1.. if score @s ri_mat1 matches 3.. if score @s ri_mat2 matches 6.. if score @s ri_essence matches 15.. run function reverend_insanity:refine/exec_502
