scoreboard players remove @s ri_essence 18
effect give @s minecraft:invisibility 20 0 true
effect give @s minecraft:speed 20 1 true
particle minecraft:dust{color:[0.58,0.72,0.86],scale:1.4} ~ ~1.0 ~ 0.4 0.6 0.4 0 26
particle minecraft:bubble_pop ~ ~1.0 ~ 0.45 0.55 0.45 0.03 25
playsound minecraft:entity.illusioner.mirror_move player @s ~ ~ ~ 0.9 1.35
tellraw @s [{text:"✦ Stealth Scales Gu ",color:"gray",bold:true},{text:"bends light across tightly overlapping fish scales—your figure vanishes!",color:"aqua"}]
