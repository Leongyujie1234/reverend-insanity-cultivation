# Cast White Boar Gu (Cost: 20 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..19 run tellraw @s [{text:"Insufficient Primeval Essence for White Boar Gu (Need 20)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 20.. run function reverend_insanity:cast/exec_103
