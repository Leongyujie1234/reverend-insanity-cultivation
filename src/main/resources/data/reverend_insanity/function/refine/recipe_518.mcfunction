# Refine [Rank 3] Sky Canopy Gu | Base Success: 12% | Requires: 8 Diamonds + 2 Netherite Scrap + 260 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..2 run tellraw @s [{text:"[Gu Refinement] Requires Rank 3 Cultivation to refine [Rank 3] Sky Canopy Gu!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. store result score @s ri_mat1 run clear @s minecraft:diamond 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. store result score @s ri_mat2 run clear @s minecraft:netherite_scrap 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. if score @s ri_mat1 matches ..7 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 3] Sky Canopy Gu! Need: 8 Diamonds + 2 Netherite Scrap + 260 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches ..1 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 3] Sky Canopy Gu! Need: 8 Diamonds + 2 Netherite Scrap + 260 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches 2.. if score @s ri_essence matches ..259 run tellraw @s [{text:"[Gu Refinement] Need 260 Primeval Essence to refine [Rank 3] Sky Canopy Gu!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 3.. if score @s ri_mat1 matches 8.. if score @s ri_mat2 matches 2.. if score @s ri_essence matches 260.. run function reverend_insanity:refine/exec_518
