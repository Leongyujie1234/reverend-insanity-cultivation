# Cast Sky Canopy Gu (Cost: 350 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..349 run tellraw @s [{text:"Insufficient Primeval Essence for Sky Canopy Gu (Need 350)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 350.. run function reverend_insanity:cast/exec_303
