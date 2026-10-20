# Smash Primeval Sea against the Aperture Wall (15 R1 / 75 R2 / 375 R3 Essence per +20% fissure; wall self-heals -4%/s!)
execute unless score @s ri_mod_client matches 1 run tellraw @s [{text:"You are not qualified to cultivate.",color:"red"}]
execute if score @s ri_mod_client matches 1 unless score @s ri_awakened matches 1.. run tellraw @s [{text:"[Aperture] You have not awakened your Aperture yet! Speak to Master, finish his trial, and use Hope Gu first.",color:"red"}]
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_stage matches ..0 run scoreboard players set @s ri_stage 1

# Rank 1: 15 Green Copper Essence per +20% smash
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 1 if score @s ri_essence matches ..14 run tellraw @s [{text:"[Aperture Wall] Need 15 Green Copper Essence to smash the wall! Right-click a Primeval Stone quickly before the wall heals!",color:"red"}]
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 1 if score @s ri_essence matches 15.. run scoreboard players add @s ri_wall 20
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 1 if score @s ri_essence matches 15.. run scoreboard players remove @s ri_essence 15

# Rank 2: 75 Red Steel Essence per +20% smash
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 2 if score @s ri_essence matches ..74 run tellraw @s [{text:"[Aperture Wall] Need 75 Red Steel Essence to smash the wall! Right-click a Primeval Stone quickly before the wall heals!",color:"red"}]
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 2 if score @s ri_essence matches 75.. run scoreboard players add @s ri_wall 20
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 2 if score @s ri_essence matches 75.. run scoreboard players remove @s ri_essence 75

# Rank 3: 375 White Silver Essence per +20% smash
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 3 if score @s ri_essence matches ..374 run tellraw @s [{text:"[Aperture Wall] Need 375 White Silver Essence to smash the wall! Right-click a Primeval Stone quickly before the wall heals!",color:"red"}]
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 3 if score @s ri_essence matches 375.. run scoreboard players add @s ri_wall 20
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. if score @s ri_rank matches 3 if score @s ri_essence matches 375.. run scoreboard players remove @s ri_essence 375

execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. run particle minecraft:splash ~ ~1.1 ~ 0.45 0.45 0.45 0.15 25
execute if score @s ri_mod_client matches 1 if score @s ri_awakened matches 1.. run playsound minecraft:block.glass.hit player @s ~ ~ ~ 1.0 0.9

# Check if Wall Fissure reached 100% in one concentrated assault!
execute if score @s ri_wall matches 100.. if score @s ri_stage matches 4 if score @s ri_rank matches 1 run function reverend_insanity:breakthrough_rank2
execute if score @s ri_wall matches 100.. if score @s ri_stage matches 4 if score @s ri_rank matches 2 run function reverend_insanity:breakthrough_rank3
execute if score @s ri_wall matches 100.. if score @s ri_stage matches 1..3 run function reverend_insanity:advance_substage
