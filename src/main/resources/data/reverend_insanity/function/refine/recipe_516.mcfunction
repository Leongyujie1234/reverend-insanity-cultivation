# Refine [Rank 3] Golden Moon Gu | Base Success: 15% | Requires: 4 Gold Blocks + 6 Diamonds + 220 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..2 run tellraw @s [{text:"[Gu Refinement] Requires Rank 3 Cultivation to refine [Rank 3] Golden Moon Gu!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. store result score @s ri_mat1 run clear @s minecraft:gold_block 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. store result score @s ri_mat2 run clear @s minecraft:diamond 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. if score @s ri_mat1 matches ..3 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 3] Golden Moon Gu! Need: 4 Gold Blocks + 6 Diamonds + 220 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches ..5 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 3] Golden Moon Gu! Need: 4 Gold Blocks + 6 Diamonds + 220 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches 6.. if score @s ri_essence matches ..219 run tellraw @s [{text:"[Gu Refinement] Need 220 Primeval Essence to refine [Rank 3] Golden Moon Gu!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches 6.. if score @s ri_essence matches 220.. run function reverend_insanity:refine/exec_516
