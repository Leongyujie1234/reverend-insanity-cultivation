# Refine [Rank 2] Iron Bone Gu | Base Success: 20% | Requires: 4 Iron Blocks + 6 Bone Blocks + 90 Primeval Essence
# Optional Success Boosters in Inventory: Diamond Block (+15%), Emerald Block (+20%), Nether Star (+50%)
execute unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Gu Refinement] Awaken your Aperture with Hope Gu before refining Gu!",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches ..1 run tellraw @s [{text:"[Gu Refinement] Requires Rank 2 Cultivation to refine [Rank 2] Iron Bone Gu!",color:"red"}]

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat1 run clear @s minecraft:iron_block 0
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. store result score @s ri_mat2 run clear @s minecraft:bone_block 0

execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches ..3 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] Iron Bone Gu! Need: 4 Iron Blocks + 6 Bone Blocks + 90 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches ..5 run tellraw @s [{text:"[Gu Refinement] Missing Materials for [Rank 2] Iron Bone Gu! Need: 4 Iron Blocks + 6 Bone Blocks + 90 Essence.",color:"red"}]
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches 6.. if score @s ri_essence matches ..89 run tellraw @s [{text:"[Gu Refinement] Need 90 Primeval Essence to refine [Rank 2] Iron Bone Gu!",color:"red"}]

# Execute refinement attempt if player has Rank, Materials, and Essence
execute if score @s ri_awakened matches 1.. if score @s ri_rank matches 2.. if score @s ri_mat1 matches 4.. if score @s ri_mat2 matches 6.. if score @s ri_essence matches 90.. run function reverend_insanity:refine/exec_515
