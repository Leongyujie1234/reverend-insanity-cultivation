# RAM-Optimized Server Tick Loop (Zero work when idle)
scoreboard players enable @a ri_action
scoreboard players enable @a ri_starter

execute as @a[scores={ri_starter=1..}] at @s run function reverend_insanity:handle_starter
execute as @a[scores={ri_rightclick=1..}] at @s run function reverend_insanity:handle_rightclick
execute as @a[scores={ri_action=1..}] at @s run function reverend_insanity:handle_action
scoreboard players set @a[scores={ri_sneak=1..}] ri_sneak 0

scoreboard players add #server ri_timer 1
execute if score #server ri_timer matches 20.. run function reverend_insanity:second_tick

# Active Chainsaw Golden Centipede Physics & 3D Chain Display Loop
execute as @a[scores={ri_chainsaw_t=1..}] at @s run function reverend_insanity:cast/chainsaw_tick
