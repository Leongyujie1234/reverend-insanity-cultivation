# Cast Golden Moon Gu (Cost: 300 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..299 run tellraw @s [{text:"Insufficient Primeval Essence for Golden Moon Gu (Need 300)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 300.. run function reverend_insanity:cast/exec_301
