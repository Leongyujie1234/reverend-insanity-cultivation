scoreboard players remove @s ri_essence 15
scoreboard players add @s ri_essence 45
execute if score @s ri_essence > @s ri_max_ess run scoreboard players operation @s ri_essence = @s ri_max_ess
particle minecraft:dust{color:[0.92,0.22,0.38],scale:1.4} ~ ~1.1 ~ 0.45 0.5 0.45 0 18
particle minecraft:dust{color:[0.25,0.95,0.45],scale:1.3} ~ ~1.4 ~ 0.35 0.4 0.35 0 16
particle minecraft:cherry_leaves ~ ~1.3 ~ 0.4 0.4 0.4 0.04 14
playsound minecraft:entity.generic.drink player @s ~ ~ ~ 1.0 1.25
tellraw @s [{text:"✦ Liquor Worm ",color:"green",bold:true},{text:"condenses fragrant wine aroma, refining your Green Copper Essence (+30 Net Essence)!",color:"aqua"}]
