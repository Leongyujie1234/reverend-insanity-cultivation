# 1Hz Server Tick for Awakened Players (No vanilla actionbar text - uses Custom Top-Left RPG HUD Overlay!):
# 1. Slow natural Primeval Sea regeneration (once every 6 seconds)
scoreboard players add @s ri_regen_sec 1
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 1 if score @s ri_aptitude matches 1 run scoreboard players add @s ri_essence 1
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 1 if score @s ri_aptitude matches 2 run scoreboard players add @s ri_essence 2
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 1 if score @s ri_aptitude matches 3 run scoreboard players add @s ri_essence 3
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 1 if score @s ri_aptitude matches 4 run scoreboard players add @s ri_essence 4

execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 2 if score @s ri_aptitude matches 1 run scoreboard players add @s ri_essence 4
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 2 if score @s ri_aptitude matches 2 run scoreboard players add @s ri_essence 7
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 2 if score @s ri_aptitude matches 3 run scoreboard players add @s ri_essence 10
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 2 if score @s ri_aptitude matches 4 run scoreboard players add @s ri_essence 14

execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 3 if score @s ri_aptitude matches 1 run scoreboard players add @s ri_essence 15
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 3 if score @s ri_aptitude matches 2 run scoreboard players add @s ri_essence 25
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 3 if score @s ri_aptitude matches 3 run scoreboard players add @s ri_essence 35
execute if score @s ri_mod_client matches 1 if score @s ri_regen_sec matches 6.. if score @s ri_rank matches 3 if score @s ri_aptitude matches 4 run scoreboard players add @s ri_essence 50

execute if score @s ri_regen_sec matches 6.. run scoreboard players set @s ri_regen_sec 0
execute if score @s ri_essence > @s ri_max_ess run scoreboard players operation @s ri_essence = @s ri_max_ess

# 2. Aperture Membrane Wall Self-Healing (-4% fissure per second)
execute if score @s ri_wall matches 1.. run scoreboard players remove @s ri_wall 4
execute if score @s ri_wall matches ..0 run scoreboard players set @s ri_wall 0
