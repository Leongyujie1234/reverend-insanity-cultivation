scoreboard players remove @s ri_essence 20
effect give @s minecraft:strength 30 0 true
effect give @s minecraft:resistance 30 0 true
particle minecraft:large_smoke ~ ~1.0 ~ 0.5 0.5 0.5 0.04 20
playsound minecraft:entity.ravager.roar player @s ~ ~ ~ 0.7 1.3
tellraw @s [{text:"✦ Black Boar phantom tempers your sinews (+Strength I & Resistance I)!",color:"gray"}]
