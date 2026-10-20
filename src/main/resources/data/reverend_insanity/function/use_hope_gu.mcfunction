# One-time Awakening via Hope Gu
execute unless score @s ri_mod_client matches 1 run tellraw @s [{text:"Master: ",color:"gold",bold:true},{text:""You are not qualified to refine or awaken Hope Gu."",color:"red"}]
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1.0 0.7
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. run clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:109}] 1
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. run tellraw @s [{text:"[Aperture] Your Primeval Aperture is already awakened and your Aptitude Grade is permanently fixed!",color:"red"}]
execute if score @s ri_mod_client matches 1 unless score @s ri_awakened matches 1.. run function reverend_insanity:awaken_aperture
