# Auto-migrate any old evoker Master NPCs in existing worlds to the new walking Daoist Elder
execute as @e[type=minecraft:evoker,tag=ri_master_npc] at @s run function reverend_insanity:spawn_master
execute as @e[type=minecraft:evoker,tag=ri_master_npc] run tp @s ~ -200 ~

# Stock nearby Librarian Villagers with Gu Refinement Recipe Books
execute as @e[type=minecraft:villager,tag=!ri_lib_stocked] if data entity @s {VillagerData:{profession:"minecraft:librarian"}} run function reverend_insanity:books/stock_librarian

# Spawn Master NPC near players who haven't awakened yet if none within 96m
execute as @a[tag=!ri_has_met_master] at @s unless entity @e[tag=ri_master_npc,distance=..96] run function reverend_insanity:spawn_master_near_player

# Subtle starlight aura at Master's feet
execute at @e[tag=ri_master_npc] run particle minecraft:end_rod ~ ~0.2 ~ 0.25 0.15 0.25 0.01 2 normal

# Tick awakened cultivators & sync all players
execute as @a[scores={ri_awakened=1..}] at @s run function reverend_insanity:regen_player
execute as @a unless score @s ri_awakened matches 1.. run function reverend_insanity:sync_player
