# Cast Earth Communication Ear Grass (Cost: 70 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..69 run tellraw @s [{text:"Insufficient Primeval Essence for Earth Communication Ear Grass (Need 70)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 70.. run function reverend_insanity:cast/exec_206
