# Direct right-click Gu activation in hand (No Gu Slots needed!)
execute unless score @s ri_mod_client matches 1 run tellraw @s [{text:"You lack the spiritual roots to activate this Gu Worm. You are not qualified.",color:"red"}]
scoreboard players set @s ri_rightclick 0
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:109}] run function reverend_insanity:use_hope_gu
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:121}] run function reverend_insanity:use_primeval_stone
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:101}] run function reverend_insanity:cast/code_101
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:102}] run function reverend_insanity:cast/code_102
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:103}] run function reverend_insanity:cast/code_103
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:104}] run function reverend_insanity:cast/code_104
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:105}] run function reverend_insanity:cast/code_105
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:106}] run function reverend_insanity:cast/code_106
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:107}] run function reverend_insanity:cast/code_107
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:108}] run function reverend_insanity:cast/code_108
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:201}] run function reverend_insanity:cast/code_201
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:202}] run function reverend_insanity:cast/code_202
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:203}] run function reverend_insanity:cast/code_203
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:204}] run function reverend_insanity:cast/code_204
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:205}] run function reverend_insanity:cast/code_205
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:206}] run function reverend_insanity:cast/code_206
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:207}] run function reverend_insanity:cast/code_207
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:301}] run function reverend_insanity:cast/code_301
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:302}] run function reverend_insanity:cast/code_302
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:303}] run function reverend_insanity:cast/code_303
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:304}] run function reverend_insanity:cast/code_304
