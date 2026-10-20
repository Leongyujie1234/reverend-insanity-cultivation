# Cast Chainsaw Golden Centipede (Cost: 250 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..249 run tellraw @s [{text:"Insufficient Primeval Essence for Chainsaw Golden Centipede (Need 250)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 250.. run function reverend_insanity:cast/exec_302
