scoreboard players remove @s ri_essence 15
effect give @s minecraft:absorption 30 1 true
effect give @s minecraft:resistance 30 0 true
particle minecraft:dust{color:[0.15,0.88,0.48],scale:1.6} ~ ~0.6 ~ 0.45 0.3 0.45 0 20
particle minecraft:dust{color:[0.40,0.98,0.68],scale:1.5} ~ ~1.3 ~ 0.45 0.35 0.45 0 22
particle minecraft:composter ~ ~1.1 ~ 0.5 0.6 0.5 0.04 24
playsound minecraft:item.armor.equip_diamond player @s ~ ~ ~ 1.0 1.25
tellraw @s [{text:"✦ Jade Skin Gu ",color:"green",bold:true},{text:"crystallizes a lustrous emerald jade carapace over your skin!",color:"aqua"}]
