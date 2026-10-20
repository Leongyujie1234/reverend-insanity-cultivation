scoreboard players set @s ri_apt_pct 0
scoreboard players set #eighty ri_roll 80
scoreboard players operation @s ri_roll = #server ri_timer
scoreboard players operation @s ri_roll %= #eighty ri_roll
scoreboard players add @s ri_roll 20
scoreboard players operation @s ri_apt_pct = @s ri_roll
execute if score @s ri_apt_pct matches 20..39 run scoreboard players set @s ri_aptitude 1
execute if score @s ri_apt_pct matches 40..59 run scoreboard players set @s ri_aptitude 2
execute if score @s ri_apt_pct matches 60..79 run scoreboard players set @s ri_aptitude 3
execute if score @s ri_apt_pct matches 80..99 run scoreboard players set @s ri_aptitude 4
execute if score @s ri_rank matches 1 run scoreboard players operation @s ri_max_ess = @s ri_apt_pct
execute if score @s ri_rank matches 2 run scoreboard players operation @s ri_max_ess = @s ri_apt_pct
execute if score @s ri_rank matches 2 run scoreboard players operation @s ri_max_ess *= #five ri_roll
execute if score @s ri_rank matches 3 run scoreboard players operation @s ri_max_ess = @s ri_apt_pct
execute if score @s ri_rank matches 3 run scoreboard players operation @s ri_max_ess *= #twentyfive ri_roll
scoreboard players operation @s ri_essence = @s ri_max_ess
tellraw @s [{text:"[Admin] ",color:"gold",bold:true},{text:"Rerolled your Aptitude to ",color:"gray"},{score:{name:"@s",objective:"ri_apt_pct"},color:"aqua",bold:true},{text:"%!",color:"aqua",bold:true}]

scoreboard players set @s ri_open_book 0
function reverend_insanity:sync_player
