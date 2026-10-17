# Multi-tick physical Chainsaw Golden Centipede whip & buzzsaw engine!
scoreboard players remove @s ri_chainsaw_t 1
kill @e[type=minecraft:block_display,tag=ri_chain_seg,distance=..18]

# Summon 4 articulated 3D chain & golden centipede segments along player's current look vector
execute positioned ^ ^1.15 ^1.6 run summon minecraft:block_display ~ ~ ~ {Tags:["ri_chain_seg"],block_state:{Name:"minecraft:chain",Properties:{axis:"z"}},transformation:{translation:[-0.2f,-0.2f,-0.2f],left_rotation:[0f,0f,0f,1f],scale:[0.45f,0.45f,0.85f],right_rotation:[0f,0f,0f,1f]}}
execute positioned ^ ^1.15 ^2.5 run summon minecraft:block_display ~ ~ ~ {Tags:["ri_chain_seg"],block_state:{Name:"minecraft:gold_block"},transformation:{translation:[-0.18f,-0.18f,-0.18f],left_rotation:[0f,0f,0f,1f],scale:[0.36f,0.36f,0.65f],right_rotation:[0f,0f,0f,1f]}}
execute positioned ^ ^1.15 ^3.4 run summon minecraft:block_display ~ ~ ~ {Tags:["ri_chain_seg"],block_state:{Name:"minecraft:chain",Properties:{axis:"z"}},transformation:{translation:[-0.2f,-0.2f,-0.2f],left_rotation:[0f,0f,0f,1f],scale:[0.45f,0.45f,0.85f],right_rotation:[0f,0f,0f,1f]}}
execute positioned ^ ^1.15 ^4.3 run summon minecraft:block_display ~ ~ ~ {Tags:["ri_chain_seg"],block_state:{Name:"minecraft:gold_block"},transformation:{translation:[-0.15f,-0.15f,-0.15f],left_rotation:[0f,0f,0f,1f],scale:[0.30f,0.30f,0.55f],right_rotation:[0f,0f,0f,1f]}}

# Spinning silver razor teeth & golden carapace sparks
particle minecraft:dust{color:[1.0,0.78,0.14],scale:1.5} ^ ^1.15 ^2.0 0.18 0.18 0.18 0 4
particle minecraft:dust{color:[0.90,0.94,0.98],scale:1.3} ^-0.28 ^1.15 ^2.8 0.08 0.08 0.08 0 3
particle minecraft:dust{color:[0.90,0.94,0.98],scale:1.3} ^0.28 ^1.15 ^2.8 0.08 0.08 0.08 0 3
particle minecraft:dust{color:[1.0,0.78,0.14],scale:1.5} ^ ^1.15 ^3.6 0.18 0.18 0.18 0 4
particle minecraft:crit ^ ^1.15 ^3.2 0.35 0.25 0.35 0.18 10
particle minecraft:sweep_attack ^ ^1.15 ^3.8 0.1 0.1 0.1 0 1

# Custom Chainsaw Physics: pull caught enemies slightly into the spinning teeth & shred them (using valid single-entity @s damage!)
execute positioned ^ ^1.1 ^3.2 as @e[distance=..2.8,type=!player,type=!minecraft:block_display,type=!minecraft:item,limit=4] at @s run tp @s ^ ^ ^0.25 facing entity @p
execute positioned ^ ^1.1 ^2.6 as @e[distance=..2.6,type=!player,type=!minecraft:block_display,limit=4] run damage @s 7 minecraft:player_attack by @p
execute positioned ^ ^1.1 ^4.2 as @e[distance=..2.6,type=!player,type=!minecraft:block_display,limit=4] run damage @s 7 minecraft:player_attack by @p

execute if score @s ri_chainsaw_t matches 1.. run playsound minecraft:block.grindstone.use player @s ~ ~ ~ 0.45 1.65
execute if score @s ri_chainsaw_t matches ..0 run kill @e[type=minecraft:block_display,tag=ri_chain_seg,distance=..24]
