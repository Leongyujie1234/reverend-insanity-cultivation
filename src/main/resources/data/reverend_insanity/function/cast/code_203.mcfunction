# Cast White Jade Gu (Cost: 120 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..119 run tellraw @s [{text:"Insufficient Primeval Essence for White Jade Gu (Need 120)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 120.. run function reverend_insanity:cast/exec_203
