scoreboard players set @s ri_wall 0
scoreboard players set @s ri_rank 2
scoreboard players set @s ri_stage 1
scoreboard players set #five ri_roll 5
scoreboard players operation @s ri_max_ess = @s ri_apt_pct
scoreboard players operation @s ri_max_ess *= #five ri_roll
scoreboard players operation @s ri_essence = @s ri_max_ess
particle minecraft:totem_of_undying ~ ~1.2 ~ 0.7 0.8 0.7 0.15 60
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 1.0
tellraw @s [{text:"[Major Realm Breakthrough] ",color:"gold",bold:true},{text:"Crystal Membrane shattered! Advanced to Rank 2 Initial Stage - Red Steel Essence (Light Red)!",color:"red"}]
