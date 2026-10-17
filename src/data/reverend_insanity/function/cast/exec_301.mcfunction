scoreboard players remove @s ri_essence 300
particle minecraft:flame ^ ^1.4 ^4 0.6 0.4 0.6 0.03 30
particle minecraft:flame ^ ^1.4 ^9 0.7 0.4 0.7 0.03 30
particle minecraft:flame ^ ^1.4 ^14 0.8 0.4 0.8 0.03 30
execute positioned ^ ^1.2 ^6 as @e[distance=..4.5,type=!player,limit=6] run damage @s 24 minecraft:magic by @p
execute positioned ^ ^1.2 ^13 as @e[distance=..4.5,type=!player,limit=6] run damage @s 24 minecraft:magic by @p
playsound minecraft:entity.blaze.shoot player @s ~ ~ ~ 1.1 0.8
