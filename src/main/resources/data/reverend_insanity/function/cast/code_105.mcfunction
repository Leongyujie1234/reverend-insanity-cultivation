# Cast Jade Skin Gu (Cost: 15 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..14 run tellraw @s [{text:"Insufficient Primeval Essence for Jade Skin Gu (Need 15)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 15.. run function reverend_insanity:cast/exec_105
