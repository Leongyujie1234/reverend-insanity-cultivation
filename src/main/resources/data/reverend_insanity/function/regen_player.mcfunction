# Decrement recipe book trigger after 1 second
execute if score @s ri_book_t matches 1.. run scoreboard players remove @s ri_book_t 1
execute if score @s ri_book_t matches ..0 run scoreboard players set @s ri_open_book 0

# Self-healing Aperture Wall (-4%/s)
execute if score @s ri_break_prog matches 1.. run scoreboard players remove @s ri_break_prog 4
execute if score @s ri_break_prog matches ..-1 run scoreboard players set @s ri_break_prog 0

# Slow Natural Primeval Sea Regeneration (once every 6 seconds)
scoreboard players add @s ri_regen_cd 1
execute if score @s ri_regen_cd matches 6.. run scoreboard players set @s ri_regen_cd 0

execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 1 if score @s ri_aptitude matches 1 run scoreboard players add @s ri_essence 1
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 1 if score @s ri_aptitude matches 2 run scoreboard players add @s ri_essence 2
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 1 if score @s ri_aptitude matches 3 run scoreboard players add @s ri_essence 3
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 1 if score @s ri_aptitude matches 4 run scoreboard players add @s ri_essence 4

execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 2 if score @s ri_aptitude matches 1 run scoreboard players add @s ri_essence 2
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 2 if score @s ri_aptitude matches 2 run scoreboard players add @s ri_essence 4
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 2 if score @s ri_aptitude matches 3 run scoreboard players add @s ri_essence 6
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 2 if score @s ri_aptitude matches 4 run scoreboard players add @s ri_essence 8

execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 3 if score @s ri_aptitude matches 1 run scoreboard players add @s ri_essence 6
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 3 if score @s ri_aptitude matches 2 run scoreboard players add @s ri_essence 12
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 3 if score @s ri_aptitude matches 3 run scoreboard players add @s ri_essence 18
execute if score @s ri_regen_cd matches 0 if score @s ri_rank matches 3 if score @s ri_aptitude matches 4 run scoreboard players add @s ri_essence 24

execute if score @s ri_essence > @s ri_max_essence run scoreboard players operation @s ri_essence = @s ri_max_essence
function reverend_insanity:sync_player
