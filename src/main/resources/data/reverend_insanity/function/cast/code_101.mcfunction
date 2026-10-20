# Cast Moonlight Gu (Cost: 10 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..9 run tellraw @s [{text:"Insufficient Primeval Essence for Moonlight Gu (Need 10)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 10.. run function reverend_insanity:cast/exec_101
