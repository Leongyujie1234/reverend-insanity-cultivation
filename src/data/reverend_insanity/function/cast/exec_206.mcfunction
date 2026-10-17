scoreboard players remove @s ri_essence 70
effect give @e[distance=1..48] minecraft:glowing 18 0 true
particle minecraft:dust{color:[0.28,0.82,0.42],scale:1.6} ~ ~0.15 ~ 1.8 0.1 1.8 0 35
particle minecraft:dust{color:[1.0,0.84,0.28],scale:1.5} ~ ~0.2 ~ 3.2 0.1 3.2 0 40
playsound minecraft:block.sculk_sensor.clicking player @s ~ ~ ~ 1.0 1.2
tellraw @s [{text:"✦ Earth Communication Ear Grass ",color:"yellow",bold:true},{text:"extends spirit roots into the earth, illuminating all entities within 48m!",color:"green"}]
