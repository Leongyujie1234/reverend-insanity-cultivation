# Cast Moonglow Gu (Cost: 80 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..79 run tellraw @s [{text:"Insufficient Primeval Essence for Moonglow Gu (Need 80)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 80.. run function reverend_insanity:cast/exec_201
