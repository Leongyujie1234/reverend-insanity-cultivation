scoreboard players set @s ri_wall 0
scoreboard players set @s ri_rank 3
scoreboard players set @s ri_stage 1
scoreboard players set #twentyfive ri_roll 25
scoreboard players operation @s ri_max_ess = @s ri_apt_pct
scoreboard players operation @s ri_max_ess *= #twentyfive ri_roll
scoreboard players operation @s ri_essence = @s ri_max_ess
particle minecraft:totem_of_undying ~ ~1.2 ~ 0.8 0.9 0.8 0.2 80
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 0.9
tellraw @s [{text:"[Major Realm Breakthrough] ",color:"gold",bold:true},{text:"Crystal Membrane shattered! Advanced to Rank 3 Initial Stage - White Silver Essence (Light Silver)!",color:"white"}]
