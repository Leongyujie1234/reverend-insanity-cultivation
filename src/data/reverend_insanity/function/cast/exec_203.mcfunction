scoreboard players remove @s ri_essence 120
effect give @s minecraft:absorption 35 2 true
effect give @s minecraft:resistance 35 1 true
particle minecraft:dust{color:[0.96,0.99,0.97],scale:1.9} ~ ~1.0 ~ 0.5 0.65 0.5 0 32
particle minecraft:dust{color:[0.88,0.72,0.22],scale:1.5} ~ ~1.2 ~ 0.55 0.5 0.55 0 20
particle minecraft:snowflake ~ ~1.1 ~ 0.5 0.6 0.5 0.03 28
playsound minecraft:item.armor.equip_netherite player @s ~ ~ ~ 1.0 1.35
tellraw @s [{text:"✦ White Jade Gu ",color:"white",bold:true},{text:"condenses impenetrable mutton-fat White Jade armor (+12 Absorption & Resistance II)!",color:"yellow"}]
