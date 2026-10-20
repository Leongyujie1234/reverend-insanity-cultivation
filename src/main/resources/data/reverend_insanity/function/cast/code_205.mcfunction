# Cast Moon Raiment Gu (Cost: 110 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..109 run tellraw @s [{text:"Insufficient Primeval Essence for Moon Raiment Gu (Need 110)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 110.. run function reverend_insanity:cast/exec_205
