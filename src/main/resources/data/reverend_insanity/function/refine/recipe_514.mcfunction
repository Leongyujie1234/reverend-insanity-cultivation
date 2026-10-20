# Refine [Rank 2] Earth Communication Ear Grass | Base Success: 25% | Requires: 4 Ender Pearls + 8 Gold Ingots + 70 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..1 run tellraw @s [{text:"[Gu Refinement] Requires Rank 2 Cultivation to refine [Rank 2] Earth Communication Ear Grass!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat1 run clear @s minecraft:ender_pearl 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat2 run clear @s minecraft:gold_ingot 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches ..3 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] Earth Communication Ear Grass! Need: 4 Ender Pearls + 8 Gold Ingots + 70 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches ..7 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] Earth Communication Ear Grass! Need: 4 Ender Pearls + 8 Gold Ingots + 70 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches 8.. if score @s ri_essence matches ..69 run tellraw @s [{text:"[Gu Refinement] Need 70 Primeval Essence to refine [Rank 2] Earth Communication Ear Grass!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches 8.. if score @s ri_essence matches 70.. run function reverend_insanity:refine/exec_514
