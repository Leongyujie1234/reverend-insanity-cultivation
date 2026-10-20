# Cast Iron Bone Gu (Cost: 150 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..149 run tellraw @s [{text:"Insufficient Primeval Essence for Iron Bone Gu (Need 150)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 150.. run function reverend_insanity:cast/exec_207
