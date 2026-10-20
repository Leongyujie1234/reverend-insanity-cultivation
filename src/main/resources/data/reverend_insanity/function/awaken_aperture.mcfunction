# Permanently awaken player's Aperture once via Hope Gu, consume Hope Gu, and roll exact Aptitude % (20..99%)
scoreboard players set @s ri_awakened 1
tag @s add ri_awakened_player
data modify storage reverend_insanity:cultivation awakened_players append from entity @s UUID

# Consume Hope Gu immediately
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{ri_code:109}] 1
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"hope_gu"}] 1

# Roll exact immutable Aptitude Percentage (20%..99%, e.g. Fang Yuan's 44% Grade C) ONLY if not already set
scoreboard players set #eighty ri_roll 80
execute unless score @s ri_apt_pct matches 20..99 run scoreboard players operation @s ri_roll = #server ri_timer
execute unless score @s ri_apt_pct matches 20..99 run scoreboard players operation @s ri_roll %= #eighty ri_roll
execute unless score @s ri_apt_pct matches 20..99 run scoreboard players add @s ri_roll 20
execute unless score @s ri_apt_pct matches 20..99 run scoreboard players operation @s ri_apt_pct = @s ri_roll
execute unless score @s ri_apt_pct matches 20..99 run scoreboard players set @s ri_apt_pct 44

# Derive Grade (20-39% = Grade D [1], 40-59% = Grade C [2], 60-79% = Grade B [3], 80-99% = Grade A [4])
execute if score @s ri_apt_pct matches 20..39 run scoreboard players set @s ri_aptitude 1
execute if score @s ri_apt_pct matches 40..59 run scoreboard players set @s ri_aptitude 2
execute if score @s ri_apt_pct matches 60..79 run scoreboard players set @s ri_aptitude 3
execute if score @s ri_apt_pct matches 80..99 run scoreboard players set @s ri_aptitude 4

scoreboard players set @s ri_rank 1
scoreboard players set @s ri_stage 1
# At Rank 1 (Base 100), Max Primeval Essence equals exact Aptitude Percentage (e.g. 44% -> 44 Max Essence!)
scoreboard players operation @s ri_max_ess = @s ri_apt_pct
scoreboard players operation @s ri_essence = @s ri_max_ess

scoreboard players set @s ri_wall 0
scoreboard players set @s ri_regen_sec 0
scoreboard players set @s ri_satiety 100
scoreboard players set @s ri_slot1 0
scoreboard players set @s ri_slot2 0
scoreboard players set @s ri_slot3 0
scoreboard players set @s ri_slot4 0

particle minecraft:end_rod ~ ~1.2 ~ 0.6 0.8 0.6 0.08 45
particle minecraft:dust{color:[1.0,0.85,0.2],scale:1.8} ~ ~1.2 ~ 0.5 0.6 0.5 0 35
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 1.1

execute if score @s ri_aptitude matches 1 run tellraw @s [{text:"[Hope Gu Awakening] ",color:"gold",bold:true},{text:"Hope Gu dissolves into golden light! Your Aperture awakened with ",color:"gray"},{text:"Grade D Aptitude (",color:"yellow",bold:true},{score:{name:"@s",objective:"ri_apt_pct"},color:"yellow",bold:true},{text:"% Primeval Sea)",color:"yellow",bold:true},{text:"! Your Aperture starts with 0 Gu Worms—press [P] to collect materials and refine your first Gu!",color:"gray"}]
execute if score @s ri_aptitude matches 2 run tellraw @s [{text:"[Hope Gu Awakening] ",color:"gold",bold:true},{text:"Hope Gu dissolves into golden light! Your Aperture awakened with ",color:"gray"},{text:"Grade C Aptitude (",color:"green",bold:true},{score:{name:"@s",objective:"ri_apt_pct"},color:"green",bold:true},{text:"% Primeval Sea)",color:"green",bold:true},{text:"! Your Aperture starts with 0 Gu Worms—press [P] to collect materials and refine your first Gu!",color:"gray"}]
execute if score @s ri_aptitude matches 3 run tellraw @s [{text:"[Hope Gu Awakening] ",color:"gold",bold:true},{text:"Hope Gu dissolves into golden light! Your Aperture awakened with ",color:"gray"},{text:"Grade B Aptitude (",color:"aqua",bold:true},{score:{name:"@s",objective:"ri_apt_pct"},color:"aqua",bold:true},{text:"% Primeval Sea)",color:"aqua",bold:true},{text:"! Your Aperture starts with 0 Gu Worms—press [P] to collect materials and refine your first Gu!",color:"gray"}]
execute if score @s ri_aptitude matches 4 run tellraw @s [{text:"[Hope Gu Awakening] ",color:"gold",bold:true},{text:"Hope Gu dissolves into golden light! Your Aperture awakened with ",color:"gray"},{text:"Grade A Aptitude (",color:"gold",bold:true},{score:{name:"@s",objective:"ri_apt_pct"},color:"gold",bold:true},{text:"% Primeval Sea)",color:"gold",bold:true},{text:"! Your Aperture starts with 0 Gu Worms—press [P] to collect materials and refine your first Gu!",color:"gray"}]
