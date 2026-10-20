scoreboard players set @s ri_awakened 1
tag @s add ri_awakened_player
scoreboard players set @s ri_rank 3
scoreboard players set @s ri_stage 4
scoreboard players set @s ri_aptitude 4
scoreboard players set @s ri_apt_pct 99
scoreboard players set @s ri_max_ess 2475
scoreboard players set @s ri_essence 2475
scoreboard players set @s ri_wall 0
function reverend_insanity:give_all_gu
tellraw @s [{text:"[Admin] ",color:"gold",bold:true},{text:"Granted Rank 3 Peak Stage (Snow Silver Essence), Grade A (99% Aptitude - 2475/2475), and all 19 Gu Worms!",color:"green"}]
