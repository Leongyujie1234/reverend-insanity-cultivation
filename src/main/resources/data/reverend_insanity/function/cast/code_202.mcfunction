# Cast Four Flavors Liquor Worm (Cost: 100 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..99 run tellraw @s [{text:"Insufficient Primeval Essence for Four Flavors Liquor Worm (Need 100)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 100.. run function reverend_insanity:cast/exec_202
