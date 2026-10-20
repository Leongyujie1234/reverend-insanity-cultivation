# Cast Thunder Wings Gu (Cost: 220 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..219 run tellraw @s [{text:"Insufficient Primeval Essence for Thunder Wings Gu (Need 220)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 220.. run function reverend_insanity:cast/exec_304
