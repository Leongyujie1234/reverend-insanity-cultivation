scoreboard players set @s ri_sync 10000000

scoreboard players operation #t ri_tmp = @s ri_open_book
scoreboard players set #c100m ri_tmp 100000000
scoreboard players operation #t ri_tmp *= #c100m ri_tmp
scoreboard players operation @s ri_sync += #t ri_tmp

scoreboard players operation #t ri_tmp = @s ri_rank
scoreboard players set #c1m ri_tmp 1000000
scoreboard players operation #t ri_tmp *= #c1m ri_tmp
scoreboard players operation @s ri_sync += #t ri_tmp

scoreboard players operation #t ri_tmp = @s ri_substage
scoreboard players set #c100k ri_tmp 100000
scoreboard players operation #t ri_tmp *= #c100k ri_tmp
scoreboard players operation @s ri_sync += #t ri_tmp

scoreboard players operation #t ri_tmp = @s ri_apt_pct
scoreboard players set #c1k ri_tmp 1000
scoreboard players operation #t ri_tmp *= #c1k ri_tmp
scoreboard players operation @s ri_sync += #t ri_tmp

scoreboard players operation #t ri_tmp = @s ri_break_prog
scoreboard players set #c10 ri_tmp 10
scoreboard players operation #t ri_tmp /= #c10 ri_tmp
execute if score #t ri_tmp matches 10.. run scoreboard players set #t ri_tmp 9
scoreboard players set #c100 ri_tmp 100
scoreboard players operation #t ri_tmp *= #c100 ri_tmp
scoreboard players operation @s ri_sync += #t ri_tmp

scoreboard players operation #e ri_tmp = @s ri_essence
scoreboard players set #c99 ri_tmp 99
scoreboard players operation #e ri_tmp *= #c99 ri_tmp
scoreboard players operation #m ri_tmp = @s ri_max_essence
execute unless score #m ri_tmp matches 1.. run scoreboard players set #m ri_tmp 1
scoreboard players operation #e ri_tmp /= #m ri_tmp
execute if score #e ri_tmp matches 100.. run scoreboard players set #e ri_tmp 99
execute if score #e ri_tmp matches ..-1 run scoreboard players set #e ri_tmp 0
scoreboard players operation @s ri_sync += #e ri_tmp
