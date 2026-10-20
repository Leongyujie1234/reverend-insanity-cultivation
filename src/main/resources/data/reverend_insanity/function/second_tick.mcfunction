scoreboard players set #server ri_timer 0
execute as @a[scores={ri_rank=1..}] at @s run function reverend_insanity:regen_player

# Auto-spawn Master on top of ground if none within 100 blocks, and make Master look toward nearby players!
execute as @a at @s unless entity @e[tag=ri_master_npc,distance=..100] run function reverend_insanity:spawn_master_near_player
execute as @e[tag=ri_master_npc] at @s if entity @a[distance=..5] facing entity @p[distance=..5] eyes run tp @s ~ ~ ~ ~ ~
execute at @e[tag=ri_master_npc] run particle minecraft:end_rod ~ ~2.2 ~ 0.2 0.5 0.2 0.01 4
