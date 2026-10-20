# Cast Little Light Gu (Cost: 12 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..11 run tellraw @s [{text:"Insufficient Primeval Essence for Little Light Gu (Need 12)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 12.. run function reverend_insanity:cast/exec_106
