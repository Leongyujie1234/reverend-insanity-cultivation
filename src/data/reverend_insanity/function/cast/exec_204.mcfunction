scoreboard players remove @s ri_essence 90
particle minecraft:crimson_spore ^ ^1.4 ^4 0.3 0.3 0.3 0.02 25
particle minecraft:crimson_spore ^ ^1.4 ^9 0.3 0.3 0.3 0.02 25
execute positioned ^ ^1.2 ^5 as @e[distance=..3.5,type=!player,limit=3] run damage @s 12 minecraft:magic by @p
execute positioned ^ ^1.2 ^5 run effect give @e[distance=..3.5,type=!player] minecraft:wither 5 1
effect give @s minecraft:regeneration 4 2 true
playsound minecraft:entity.warden.attack_impact player @s ~ ~ ~ 0.8 1.5
