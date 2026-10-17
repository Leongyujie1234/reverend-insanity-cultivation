scoreboard players remove @s ri_essence 20
effect give @s minecraft:strength 35 0 true
effect give @s minecraft:resistance 35 0 true
particle minecraft:dust{color:[0.18,0.17,0.24],scale:2.2} ~ ~1.6 ~ 0.55 0.45 0.55 0 30
particle minecraft:large_smoke ~ ~0.4 ~ 0.6 0.2 0.6 0.04 20
particle minecraft:crit ^ ^1.0 ^2.0 0.5 0.3 0.5 0.15 20
execute positioned ^ ^1.0 ^2.2 as @e[distance=..3.0,type=!player,limit=3] run damage @s 6 minecraft:player_attack by @p
playsound minecraft:entity.ravager.roar player @s ~ ~ ~ 0.8 1.25
tellraw @s [{text:"✦ Black Boar Gu ",color:"dark_gray",bold:true},{text:"forges your sinews with obsidian boar power (+Strength I & Resistance I)!",color:"gray"}]
