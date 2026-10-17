scoreboard players remove @s ri_essence 250
particle minecraft:crit ^ ^1.2 ^2.5 0.7 0.5 0.7 0.2 45
execute positioned ^ ^1.2 ^2.5 as @e[distance=..3.8,type=!player,limit=5] run damage @s 28 minecraft:player_attack by @p
playsound minecraft:block.grindstone.use player @s ~ ~ ~ 1.2 0.7
