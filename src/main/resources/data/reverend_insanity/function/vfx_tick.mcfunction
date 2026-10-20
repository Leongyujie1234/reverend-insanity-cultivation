# Move flying Gu VFX item_display projections forward and emit trailing particles, then despawn after 14 ticks
execute as @e[tag=ri_vfx_move] at @s run tp @s ^ ^ ^0.95
execute as @e[tag=ri_vfx_move] at @s run particle minecraft:end_rod ~ ~ ~ 0.12 0.12 0.12 0.01 2
execute as @e[tag=ri_vfx] run scoreboard players add @s ri_vfx_age 1
kill @e[tag=ri_vfx,scores={ri_vfx_age=14..}]
