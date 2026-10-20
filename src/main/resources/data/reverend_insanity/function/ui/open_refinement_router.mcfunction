execute unless score @s ri_mod_client matches 1 run tellraw @s [{text:"[Reverend Insanity] Client mod required!",color:"red"}]
execute if score @s ri_mod_client matches 1 run function reverend_insanity:ui/modded_refinement
