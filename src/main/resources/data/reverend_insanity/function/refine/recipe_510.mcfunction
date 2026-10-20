# Refine [Rank 2] Four Flavors Liquor Worm | Base Success: 24% | Requires: 6 Blaze Powder + 2 Ghast Tears + 80 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..1 run tellraw @s [{text:"[Gu Refinement] Requires Rank 2 Cultivation to refine [Rank 2] Four Flavors Liquor Worm!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat1 run clear @s minecraft:blaze_powder 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat2 run clear @s minecraft:ghast_tear 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches ..5 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] Four Flavors Liquor Worm! Need: 6 Blaze Powder + 2 Ghast Tears + 80 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 6.. if score @s ri_mat2 matches ..1 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] Four Flavors Liquor Worm! Need: 6 Blaze Powder + 2 Ghast Tears + 80 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 6.. if score @s ri_mat2 matches 2.. if score @s ri_essence matches ..79 run tellraw @s [{text:"[Gu Refinement] Need 80 Primeval Essence to refine [Rank 2] Four Flavors Liquor Worm!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 6.. if score @s ri_mat2 matches 2.. if score @s ri_essence matches 80.. run function reverend_insanity:refine/exec_510
