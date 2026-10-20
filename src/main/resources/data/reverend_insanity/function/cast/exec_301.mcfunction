scoreboard players remove @s ri_essence 300
summon minecraft:area_effect_cloud ^ ^1.25 ^1.2 {Tags:["ri_proj","ri_proj_301"],Duration:15,Radius:0f,WaitTime:0}
execute as @e[tag=ri_proj_301,distance=..3,limit=1] run tp @s ~ ~ ~ ~ ~
particle minecraft:dust{color:[0.92,0.58,0.06],scale:1.8} ^0.0 ^1.8 ^3.2 0.05 0.05 0.05 0 4
particle minecraft:dust{color:[1.0,0.74,0.12],scale:2.1} ^0.62 ^1.2 ^3.35 0.05 0.05 0.05 0 4
particle minecraft:dust{color:[1.0,0.86,0.25],scale:2.35} ^0.96 ^0.6 ^3.5 0.05 0.05 0.05 0 5
particle minecraft:dust{color:[1.0,0.96,0.68],scale:2.5} ^1.1 ^0.0 ^3.6 0.05 0.05 0.05 0 6
particle minecraft:dust{color:[1.0,0.86,0.25],scale:2.35} ^0.96 ^-0.6 ^3.5 0.05 0.05 0.05 0 5
particle minecraft:dust{color:[1.0,0.74,0.12],scale:2.1} ^0.62 ^-1.2 ^3.35 0.05 0.05 0.05 0 4
particle minecraft:dust{color:[0.92,0.58,0.06],scale:1.8} ^0.0 ^-1.8 ^3.2 0.05 0.05 0.05 0 4
particle minecraft:flame ^ ^1.3 ^6.5 0.65 0.35 0.65 0.03 30
particle minecraft:dust{color:[1.0,0.82,0.16],scale:2.2} ^ ^1.3 ^10.5 0.7 0.35 0.7 0 18
particle minecraft:flame ^ ^1.3 ^14.0 0.75 0.35 0.75 0.03 30
execute positioned ^ ^1.2 ^6 as @e[distance=..4.5,type=!player,limit=6] run damage @s 24 minecraft:magic by @p
execute positioned ^ ^1.2 ^13 as @e[distance=..4.5,type=!player,limit=6] run damage @s 24 minecraft:magic by @p
playsound minecraft:entity.blaze.shoot player @s ~ ~ ~ 1.1 0.8
