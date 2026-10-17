scoreboard players remove @s ri_essence 10
# --- Crescent Moonlight Blade VFX (pale-azure energy moon) ---
particle minecraft:end_rod ^ ^1.35 ^0.5 0.05 0.05 0.05 0.01 3
particle minecraft:dust{color:[0.62,0.84,1.0],scale:1.0} ^0.0 ^1.15 ^2.0 0.02 0.02 0.02 0 2
particle minecraft:dust{color:[0.62,0.84,1.0],scale:1.3} ^0.38 ^0.78 ^2.05 0.02 0.02 0.02 0 2
particle minecraft:dust{color:[0.66,0.87,1.0],scale:1.5} ^0.6 ^0.38 ^2.1 0.02 0.02 0.02 0 2
particle minecraft:dust{color:[0.7,0.9,1.0],scale:1.6} ^0.68 ^0.0 ^2.15 0.02 0.02 0.02 0 2
particle minecraft:dust{color:[0.66,0.87,1.0],scale:1.5} ^0.6 ^-0.38 ^2.1 0.02 0.02 0.02 0 2
particle minecraft:dust{color:[0.62,0.84,1.0],scale:1.3} ^0.38 ^-0.78 ^2.05 0.02 0.02 0.02 0 2
particle minecraft:dust{color:[0.62,0.84,1.0],scale:1.0} ^0.0 ^-1.15 ^2.0 0.02 0.02 0.02 0 2
particle minecraft:end_rod ^0.0 ^1.15 ^2.0 0.03 0.03 0.03 0 2
particle minecraft:end_rod ^0.0 ^-1.15 ^2.0 0.03 0.03 0.03 0 2
particle minecraft:sweep_attack ^0.25 ^0.0 ^2.1 0.3 0.9 0.1 0 1
particle minecraft:dust{color:[0.55,0.78,1.0],scale:0.85} ^0.1 ^0.85 ^1.1 0.03 0.03 0.03 0 2
particle minecraft:dust{color:[0.55,0.78,1.0],scale:0.65} ^0.16 ^0.55 ^0.6 0.03 0.03 0.03 0 2
execute positioned ^ ^1.2 ^4 as @e[distance=..3.5,type=!player,limit=3] run damage @s 8 minecraft:magic by @p
execute positioned ^ ^1.2 ^9 as @e[distance=..3.5,type=!player,limit=3] run damage @s 8 minecraft:magic by @p
playsound minecraft:item.trident.throw player @s ~ ~ ~ 1.0 1.5
playsound minecraft:entity.player.attack.sweep player @s ~ ~ ~ 0.6 1.4
