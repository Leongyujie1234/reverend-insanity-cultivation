scoreboard players remove @s ri_essence 80
# --- Sapphire Moonglow Blade VFX (large piercing crescent) ---
particle minecraft:end_rod ^ ^1.35 ^0.5 0.05 0.05 0.05 0.01 4
particle minecraft:dust{color:[0.35,0.6,1.0],scale:1.3} ^0.0 ^1.5 ^3.0 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.35,0.6,1.0],scale:1.7} ^0.5 ^1.0 ^3.1 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.42,0.66,1.0],scale:1.9} ^0.78 ^0.5 ^3.2 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.5,0.72,1.0],scale:2.0} ^0.88 ^0.0 ^3.3 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.42,0.66,1.0],scale:1.9} ^0.78 ^-0.5 ^3.2 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.35,0.6,1.0],scale:1.7} ^0.5 ^-1.0 ^3.1 0.03 0.03 0.03 0 3
particle minecraft:dust{color:[0.35,0.6,1.0],scale:1.3} ^0.0 ^-1.5 ^3.0 0.03 0.03 0.03 0 3
particle minecraft:end_rod ^0.0 ^1.5 ^3.0 0.04 0.04 0.04 0 3
particle minecraft:end_rod ^0.0 ^-1.5 ^3.0 0.04 0.04 0.04 0 3
particle minecraft:sweep_attack ^0.35 ^0.0 ^3.2 0.4 1.2 0.15 0 1
particle minecraft:dust{color:[0.3,0.55,1.0],scale:1.0} ^0.1 ^0.35 ^6.0 0.06 0.06 0.06 0 3
particle minecraft:dust{color:[0.3,0.55,1.0],scale:0.85} ^0.08 ^0.3 ^9.5 0.06 0.06 0.06 0 3
particle minecraft:dust{color:[0.28,0.5,0.95],scale:0.7} ^0.05 ^0.25 ^13.0 0.07 0.07 0.07 0 2
execute positioned ^ ^1.2 ^6 as @e[distance=..4.0,type=!player,limit=4] run damage @s 14 minecraft:magic by @p
execute positioned ^ ^1.2 ^13 as @e[distance=..4.0,type=!player,limit=4] run damage @s 14 minecraft:magic by @p
playsound minecraft:item.trident.return player @s ~ ~ ~ 1.0 1.4
