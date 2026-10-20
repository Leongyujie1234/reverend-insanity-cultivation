# Cast Blood Moon Gu (Cost: 90 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..89 run tellraw @s [{text:"Insufficient Primeval Essence for Blood Moon Gu (Need 90)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 90.. run function reverend_insanity:cast/exec_204
