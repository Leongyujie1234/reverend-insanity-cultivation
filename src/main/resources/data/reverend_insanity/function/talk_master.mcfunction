# Triggered when a player right-clicks Master's interaction hitbox or sneaks near Master
scoreboard players set @s ri_talk_npc 0
execute unless score @s ri_mod_client matches 1 run playsound minecraft:entity.evoker.ambient player @s ~ ~ ~ 1.0 0.75
execute unless score @s ri_mod_client matches 1 run tellraw @s [{text:"Master: ",color:"gold",bold:true},{text:""Hmph. A mortal without spiritual roots dares approach this seat? You are not qualified."",color:"red"}]
execute if score @s ri_mod_client matches 1 run function reverend_insanity:master_quest_dialog
