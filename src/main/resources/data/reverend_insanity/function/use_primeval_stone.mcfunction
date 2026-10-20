execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu before absorbing Primeval Stones!",color:"red"}]
execute if score @s ri_rank matches 1 run scoreboard players add @s ri_essence 45
execute if score @s ri_rank matches 2 run scoreboard players add @s ri_essence 225
execute if score @s ri_rank matches 3 run scoreboard players add @s ri_essence 1125
execute if score @s ri_rank matches 1.. if score @s ri_essence > @s ri_max_ess run scoreboard players operation @s ri_essence = @s ri_max_ess
execute if score @s ri_rank matches 1.. run scoreboard players set @s ri_satiety 100
execute if score @s ri_rank matches 1.. run particle minecraft:happy_villager ~ ~1.1 ~ 0.4 0.5 0.4 0.05 20
execute if score @s ri_rank matches 1.. run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1.0 1.3
execute if score @s ri_rank matches 1.. run tellraw @s [{text:"✦ Absorbed Primeval Stone! ",color:"aqua"},{text:"+45% Primeval Essence & Fed Active Gu (100% Satiety).",color:"green"}]
execute if score @s ri_rank matches 1.. run clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:121}] 1
