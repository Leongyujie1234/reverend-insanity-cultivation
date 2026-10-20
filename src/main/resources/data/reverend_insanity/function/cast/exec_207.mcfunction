scoreboard players remove @s ri_essence 150
effect give @s minecraft:health_boost 90 1 true
effect give @s minecraft:resistance 45 0 true
particle minecraft:dust{color:[0.46,0.50,0.56],scale:1.8} ~ ~1.0 ~ 0.45 0.6 0.45 0 30
particle minecraft:scrape ~ ~1.1 ~ 0.45 0.55 0.45 0.05 24
playsound minecraft:block.anvil.use player @s ~ ~ ~ 0.85 1.35
tellraw @s [{text:"✦ Iron Bone Gu ",color:"gray",bold:true},{text:"forges your skeleton into black iron (+8 Max HP & Resistance)!",color:"white"}]
