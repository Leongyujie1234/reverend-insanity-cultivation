# Spawn Master 6 blocks away ON TOP OF THE SOLID GROUND (positioned over motion_blocking_no_leaves prevents spawning inside blocks!)
execute positioned ~6 ~ ~6 positioned over motion_blocking_no_leaves run function reverend_insanity:spawn_master
execute unless score @s ri_master_seen matches 1 run tellraw @s [{text:"[Qing Mao Mountain] ",color:"gold",bold:true},{text:"Master",color:"yellow",bold:true},{text:" is walking nearby (glowing in gold). Walk up and right-click him to begin your Awakening Trial!",color:"gray"}]
scoreboard players set @s ri_master_seen 1
