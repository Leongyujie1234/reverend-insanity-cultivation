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
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:1}] run function reverend_insanity:books/open_recipe_1
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:1}] run function reverend_insanity:books/open_recipe_1
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:2}] run function reverend_insanity:books/open_recipe_2
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:2}] run function reverend_insanity:books/open_recipe_2
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:3}] run function reverend_insanity:books/open_recipe_3
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:3}] run function reverend_insanity:books/open_recipe_3
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:4}] run function reverend_insanity:books/open_recipe_4
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:4}] run function reverend_insanity:books/open_recipe_4
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:5}] run function reverend_insanity:books/open_recipe_5
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:5}] run function reverend_insanity:books/open_recipe_5
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:6}] run function reverend_insanity:books/open_recipe_6
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:6}] run function reverend_insanity:books/open_recipe_6
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:7}] run function reverend_insanity:books/open_recipe_7
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:7}] run function reverend_insanity:books/open_recipe_7
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:8}] run function reverend_insanity:books/open_recipe_8
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:8}] run function reverend_insanity:books/open_recipe_8
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:9}] run function reverend_insanity:books/open_recipe_9
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:9}] run function reverend_insanity:books/open_recipe_9
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:10}] run function reverend_insanity:books/open_recipe_10
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:10}] run function reverend_insanity:books/open_recipe_10
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:11}] run function reverend_insanity:books/open_recipe_11
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:11}] run function reverend_insanity:books/open_recipe_11
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:12}] run function reverend_insanity:books/open_recipe_12
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:12}] run function reverend_insanity:books/open_recipe_12
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:13}] run function reverend_insanity:books/open_recipe_13
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:13}] run function reverend_insanity:books/open_recipe_13
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:14}] run function reverend_insanity:books/open_recipe_14
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:14}] run function reverend_insanity:books/open_recipe_14
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:15}] run function reverend_insanity:books/open_recipe_15
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:15}] run function reverend_insanity:books/open_recipe_15
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:16}] run function reverend_insanity:books/open_recipe_16
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:16}] run function reverend_insanity:books/open_recipe_16
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:17}] run function reverend_insanity:books/open_recipe_17
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:17}] run function reverend_insanity:books/open_recipe_17
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:18}] run function reverend_insanity:books/open_recipe_18
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:18}] run function reverend_insanity:books/open_recipe_18
execute if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:19}] run function reverend_insanity:books/open_recipe_19
execute unless items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick if items entity @s weapon.offhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_recipe_book:19}] run function reverend_insanity:books/open_recipe_19
execute if score @s ri_mod_client matches 1 if items entity @s weapon.mainhand minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:304}] run function reverend_insanity:cast/code_304
function reverend_insanity:sync_player
