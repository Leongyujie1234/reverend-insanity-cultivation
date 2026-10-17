# reverend_insanity:admin/clear_cultivation - resets ALL cultivation progress of the executing player.
# Usage: /execute as <player> run function reverend_insanity:admin/clear_cultivation
scoreboard players set @s ri_rank 0
scoreboard players set @s ri_stage 0
scoreboard players set @s ri_aptitude 0
scoreboard players set @s ri_essence 0
scoreboard players set @s ri_max_ess 0
scoreboard players set @s ri_wall 0
scoreboard players set @s ri_meditate 0
scoreboard players set @s ri_bind_idx 0
scoreboard players set @s ri_satiety 0
scoreboard players set @s ri_light_bst 0
scoreboard players set @s ri_slot1 101
scoreboard players set @s ri_slot2 105
scoreboard players set @s ri_slot3 107
scoreboard players set @s ri_slot4 108
scoreboard players set @s ri_starter 0
scoreboard players set @s ri_action 0
tellraw @s [{"text":"✦ Your cultivation has been reset. ","color":"gold","bold":true},{"text":"Awaken again with a Hope Gu.","color":"gray"}]
