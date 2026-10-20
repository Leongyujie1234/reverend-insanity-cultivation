# Cast Stealth Scales Gu (Cost: 18 Primeval Essence)
execute if score @s ri_rank matches ..0 run tellraw @s [{text:"Awaken your Aperture with Hope Gu first!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches ..17 run tellraw @s [{text:"Insufficient Primeval Essence for Stealth Scales Gu (Need 18)!",color:"red"}]
execute if score @s ri_rank matches 1.. if score @s ri_essence matches 18.. run function reverend_insanity:cast/exec_107
