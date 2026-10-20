scoreboard players remove @s ri_essence 12
scoreboard players set @s ri_light_bst 1
particle minecraft:dust{color:[1.0,0.88,0.28],scale:1.7} ~ ~1.35 ~ 0.4 0.4 0.4 0 25
particle minecraft:end_rod ~ ~1.35 ~ 0.35 0.35 0.35 0.06 22
playsound minecraft:block.amethyst_cluster.place player @s ~ ~ ~ 1.0 1.6
tellraw @s [{text:"✦ Little Light Gu ",color:"yellow",bold:true},{text:"infuses dazzling starlight into your next Moon Blade!",color:"gold"}]
