scoreboard players remove @s ri_essence 350
effect give @s minecraft:absorption 40 4 true
effect give @s minecraft:resistance 40 2 true
effect give @s minecraft:fire_resistance 40 0 true
particle minecraft:dust{color:[0.95,0.98,1.0],scale:2.2} ~ ~1.8 ~ 0.9 0.4 0.9 0 35
particle minecraft:dust{color:[0.22,0.74,0.98],scale:1.9} ~ ~1.0 ~ 1.1 0.6 1.1 0 35
particle minecraft:totem_of_undying ~ ~1.1 ~ 0.75 0.75 0.75 0.12 45
playsound minecraft:block.beacon.activate player @s ~ ~ ~ 1.0 1.25
tellraw @s [{text:"✦ Sky Canopy Gu ",color:"aqua",bold:true},{text:"erects a Rank 3 dome of white-gold armor (+20 Absorption HP & Resistance III)!",color:"white"}]
