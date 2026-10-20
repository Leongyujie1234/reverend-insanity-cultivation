execute unless entity @s[tag=ri_mod_client] run playsound minecraft:entity.villager.no master @s ~ ~ ~ 0.9 0.8
execute unless entity @s[tag=ri_mod_client] run tellraw @s [{"text":"[Heaven's Will] ","color":"red"},{"text":"You cannot comprehend this Gu Refinement Recipe Book without a cultivated spiritual sense.","color":"gray"}]
execute if entity @s[tag=ri_mod_client] run playsound minecraft:item.book.page_turn master @s ~ ~ ~ 1.0 1.1
execute if entity @s[tag=ri_mod_client] run scoreboard players set @s ri_open_book 15
execute if entity @s[tag=ri_mod_client] run scoreboard players set @s ri_book_t 2
execute if entity @s[tag=ri_mod_client] run function reverend_insanity:sync_player
