scoreboard players remove @s ri_essence 110
effect give @a[distance=..8] minecraft:resistance 30 0 true
effect give @a[distance=..8] minecraft:speed 30 0 true
effect give @a[distance=..8] minecraft:slow_falling 20 0 true
particle minecraft:dust{color:[0.66,0.85,1.0],scale:1.6} ~ ~1.0 ~ 1.6 0.6 1.6 0 38
particle minecraft:end_rod ~ ~1.1 ~ 1.4 0.6 1.4 0.03 32
playsound minecraft:block.beacon.ambient player @s ~ ~ ~ 1.0 1.45
tellraw @s [{text:"✦ Moon Raiment Gu ",color:"aqua",bold:true},{text:"weaves luminous silver-blue lunar silk around you and nearby allies!",color:"white"}]
