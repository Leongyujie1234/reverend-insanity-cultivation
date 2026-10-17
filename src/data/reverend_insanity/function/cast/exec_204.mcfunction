scoreboard players remove @s ri_essence 90
particle minecraft:dust{color:[0.55,0.02,0.08],scale:1.3} ^0.0 ^1.25 ^2.4 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.75,0.04,0.12],scale:1.6} ^0.42 ^0.85 ^2.5 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.92,0.08,0.16],scale:1.85} ^0.68 ^0.42 ^2.6 0.03 0.03 0.03 0 4
particle minecraft:dust{color:[1.0,0.18,0.24],scale:2.0} ^0.78 ^0.0 ^2.65 0.03 0.03 0.03 0 4
particle minecraft:dust{color:[0.92,0.08,0.16],scale:1.85} ^0.68 ^-0.42 ^2.6 0.03 0.03 0.03 0 4
particle minecraft:dust{color:[0.75,0.04,0.12],scale:1.6} ^0.42 ^-0.85 ^2.5 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.55,0.02,0.08],scale:1.3} ^0.0 ^-1.25 ^2.4 0.03 0.03 0.03 0 3
particle minecraft:crimson_spore ^ ^1.3 ^5.5 0.35 0.25 0.35 0.02 25
particle minecraft:dust{color:[0.88,0.06,0.14],scale:1.5} ^ ^1.3 ^9.0 0.3 0.25 0.3 0 14
execute positioned ^ ^1.2 ^5 as @e[distance=..3.5,type=!player,limit=3] run damage @s 12 minecraft:magic by @p
execute positioned ^ ^1.2 ^9 as @e[distance=..3.5,type=!player,limit=3] run damage @s 12 minecraft:magic by @p
execute positioned ^ ^1.2 ^5 run effect give @e[distance=..3.8,type=!player] minecraft:wither 5 1
effect give @s minecraft:regeneration 4 2 true
playsound minecraft:entity.warden.attack_impact player @s ~ ~ ~ 0.8 1.5
