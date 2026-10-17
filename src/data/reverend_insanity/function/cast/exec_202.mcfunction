scoreboard players remove @s ri_essence 100
scoreboard players add @s ri_essence 240
execute if score @s ri_essence > @s ri_max_ess run scoreboard players operation @s ri_essence = @s ri_max_ess
particle minecraft:dust{color:[0.25,0.92,0.38],scale:1.6} ~-0.6 ~0.8 ~ 0.2 0.2 0.2 0 12
particle minecraft:dust{color:[1.0,0.82,0.22],scale:1.6} ~0.6 ~1.1 ~ 0.2 0.2 0.2 0 12
particle minecraft:dust{color:[0.75,0.32,1.0],scale:1.6} ~ ~1.4 ~-0.6 0.2 0.2 0.2 0 12
particle minecraft:dust{color:[1.0,0.24,0.32],scale:1.6} ~ ~1.7 ~0.6 0.2 0.2 0.2 0 12
particle minecraft:witch ~ ~1.2 ~ 0.45 0.5 0.45 0.04 25
playsound minecraft:entity.generic.drink player @s ~ ~ ~ 1.0 0.95
tellraw @s [{text:"✦ Four Flavors Liquor Worm ",color:"gold",bold:true},{text:"swirls Sour, Sweet, Bitter, and Spicy spirit wines (+140 Net Red Steel Essence)!",color:"red"}]
