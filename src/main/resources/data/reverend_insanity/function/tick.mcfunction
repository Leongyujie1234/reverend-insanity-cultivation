# Server Tick Loop (20Hz)
scoreboard players enable @a ri_action

# 1. Right-clicking Master (wandering_trader triggers ri_talk_npc natively!)
execute as @a[scores={ri_talk_npc=1..}] at @s if entity @e[tag=ri_master_npc,distance=..6] run function reverend_insanity:talk_master
scoreboard players set @a[scores={ri_talk_npc=1..}] ri_talk_npc 0

# 2. Handle Gu item right-clicks in hand and UI trigger actions
execute as @a[scores={ri_rightclick=1..}] at @s run function reverend_insanity:handle_rightclick
execute as @a[scores={ri_action=1..}] at @s run function reverend_insanity:handle_action
scoreboard players set @a[scores={ri_sneak=1..}] ri_sneak 0

# 3. Animate 20Hz Traveling Gu Projectiles (Crescent Moon Blades, Boar Charges, etc.)
execute if entity @e[tag=ri_proj] run function reverend_insanity:proj_tick

# 4. 1Hz timer for slow Primeval Sea regeneration, Wall self-healing, and Master reactivity
scoreboard players add #server ri_timer 1
execute if score #server ri_timer matches 20.. run function reverend_insanity:second_tick

# 5. Active Chainsaw Golden Centipede Physics
execute as @a[scores={ri_chainsaw_t=1..}] at @s run function reverend_insanity:cast/chainsaw_tick
