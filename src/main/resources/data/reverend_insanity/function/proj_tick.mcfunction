# Advance all invisible flying Gu projectile markers forward by 1.35 blocks per tick (27 blocks/sec)
execute as @e[tag=ri_proj] at @s run tp @s ^ ^ ^1.35

# [101] Moonlight Gu: Traveling 9-point curved Azure Crescent Moon Blade + Custom Sweep Slash
execute as @e[tag=ri_proj_101] at @s run particle minecraft:sweep_attack ^ ^ ^ 0 0 0 0 1
execute as @e[tag=ri_proj_101] at @s run particle minecraft:dust{color:[0.35,0.88,1.0],scale:1.5} ^-0.9 ^0.55 ^-0.3 0.02 0.02 0.02 0 2
execute as @e[tag=ri_proj_101] at @s run particle minecraft:dust{color:[0.50,0.92,1.0],scale:1.7} ^-0.6 ^0.35 ^-0.1 0.02 0.02 0.02 0 2
execute as @e[tag=ri_proj_101] at @s run particle minecraft:dust{color:[0.70,0.96,1.0],scale:1.9} ^-0.3 ^0.18 ^0.1 0.02 0.02 0.02 0 2
execute as @e[tag=ri_proj_101] at @s run particle minecraft:dust{color:[0.90,0.99,1.0],scale:2.1} ^0.0 ^0.0 ^0.25 0.02 0.02 0.02 0 3
execute as @e[tag=ri_proj_101] at @s run particle minecraft:dust{color:[0.70,0.96,1.0],scale:1.9} ^0.3 ^-0.18 ^0.1 0.02 0.02 0.02 0 2
execute as @e[tag=ri_proj_101] at @s run particle minecraft:dust{color:[0.50,0.92,1.0],scale:1.7} ^0.6 ^-0.35 ^-0.1 0.02 0.02 0.02 0 2
execute as @e[tag=ri_proj_101] at @s run particle minecraft:dust{color:[0.35,0.88,1.0],scale:1.5} ^0.9 ^-0.55 ^-0.3 0.02 0.02 0.02 0 2
execute as @e[tag=ri_proj_101] at @s run particle minecraft:electric_spark ^ ^ ^ 0.25 0.25 0.25 0.02 3
execute as @e[tag=ri_proj_101] at @s as @e[distance=..2.3,type=!player,tag=!ri_proj,tag=!ri_master_npc,limit=3] run damage @s 8 minecraft:magic

# [201] Moonglow Gu: Traveling Wide Sapphire Crescent Wave
execute as @e[tag=ri_proj_201] at @s run particle minecraft:sweep_attack ^ ^ ^ 0.2 0.2 0.2 0 2
execute as @e[tag=ri_proj_201] at @s run particle minecraft:dust{color:[0.15,0.45,1.0],scale:2.2} ^-1.2 ^0.6 ^-0.3 0.04 0.04 0.04 0 3
execute as @e[tag=ri_proj_201] at @s run particle minecraft:dust{color:[0.35,0.75,1.0],scale:2.5} ^-0.6 ^0.3 ^0.0 0.04 0.04 0.04 0 3
execute as @e[tag=ri_proj_201] at @s run particle minecraft:dust{color:[0.75,0.95,1.0],scale:2.8} ^0.0 ^0.0 ^0.3 0.04 0.04 0.04 0 4
execute as @e[tag=ri_proj_201] at @s run particle minecraft:dust{color:[0.35,0.75,1.0],scale:2.5} ^0.6 ^-0.3 ^0.0 0.04 0.04 0.04 0 3
execute as @e[tag=ri_proj_201] at @s run particle minecraft:dust{color:[0.15,0.45,1.0],scale:2.2} ^1.2 ^-0.6 ^-0.3 0.04 0.04 0.04 0 3
execute as @e[tag=ri_proj_201] at @s run particle minecraft:glow ^ ^ ^ 0.4 0.3 0.4 0.02 5
execute as @e[tag=ri_proj_201] at @s as @e[distance=..2.6,type=!player,tag=!ri_proj,tag=!ri_master_npc,limit=4] run damage @s 14 minecraft:magic

# [204] Blood Moon Gu: Traveling Crimson Bleed Crescent Slash
execute as @e[tag=ri_proj_204] at @s run particle minecraft:sweep_attack ^ ^ ^ 0.1 0.1 0.1 0 1
execute as @e[tag=ri_proj_204] at @s run particle minecraft:dust{color:[0.65,0.02,0.08],scale:2.2} ^-1.1 ^0.5 ^-0.25 0.03 0.03 0.03 0 3
execute as @e[tag=ri_proj_204] at @s run particle minecraft:dust{color:[0.95,0.08,0.15],scale:2.6} ^0.0 ^0.0 ^0.25 0.03 0.03 0.03 0 4
execute as @e[tag=ri_proj_204] at @s run particle minecraft:dust{color:[0.65,0.02,0.08],scale:2.2} ^1.1 ^-0.5 ^-0.25 0.03 0.03 0.03 0 3
execute as @e[tag=ri_proj_204] at @s run particle minecraft:crimson_spore ^ ^ ^ 0.35 0.35 0.35 0.02 6
execute as @e[tag=ri_proj_204] at @s as @e[distance=..2.5,type=!player,tag=!ri_proj,tag=!ri_master_npc,limit=4] run effect give @s minecraft:wither 5 1
execute as @e[tag=ri_proj_204] at @s as @e[distance=..2.5,type=!player,tag=!ri_proj,tag=!ri_master_npc,limit=4] run damage @s 12 minecraft:magic

# [301] Golden Moon Gu: Traveling 3.2m Giant Imperial Gold Crescent Wave
execute as @e[tag=ri_proj_301] at @s run particle minecraft:sweep_attack ^ ^ ^ 0.4 0.3 0.4 0 3
execute as @e[tag=ri_proj_301] at @s run particle minecraft:dust{color:[0.95,0.65,0.05],scale:2.8} ^-1.6 ^0.7 ^-0.4 0.05 0.05 0.05 0 4
execute as @e[tag=ri_proj_301] at @s run particle minecraft:dust{color:[1.0,0.85,0.20],scale:3.0} ^-0.8 ^0.35 ^0.0 0.05 0.05 0.05 0 4
execute as @e[tag=ri_proj_301] at @s run particle minecraft:dust{color:[1.0,0.98,0.65],scale:3.4} ^0.0 ^0.0 ^0.4 0.05 0.05 0.05 0 5
execute as @e[tag=ri_proj_301] at @s run particle minecraft:dust{color:[1.0,0.85,0.20],scale:3.0} ^0.8 ^-0.35 ^0.0 0.05 0.05 0.05 0 4
execute as @e[tag=ri_proj_301] at @s run particle minecraft:dust{color:[0.95,0.65,0.05],scale:2.8} ^1.6 ^-0.7 ^-0.4 0.05 0.05 0.05 0 4
execute as @e[tag=ri_proj_301] at @s run particle minecraft:flame ^ ^ ^ 0.5 0.3 0.5 0.03 6
execute as @e[tag=ri_proj_301] at @s as @e[distance=..3.2,type=!player,tag=!ri_proj,tag=!ri_master_npc,limit=5] run damage @s 24 minecraft:magic

# Cleanup after 12 ticks (~16 blocks range)
execute as @e[tag=ri_proj] run scoreboard players add @s ri_proj_age 1
kill @e[tag=ri_proj,scores={ri_proj_age=12..}]
