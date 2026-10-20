# Consume base materials and Primeval Essence
clear @s minecraft:phantom_membrane 6
clear @s minecraft:amethyst_shard 8
scoreboard players remove @s ri_essence 85

# Base success threshold = 22%
scoreboard players set @s ri_ref_req 22

# Check optional Catalyst Boosters in inventory (Nether Star +50%, Emerald Block +20%, Diamond Block +15%)
execute store result score @s ri_cat3 run clear @s minecraft:nether_star 0
execute store result score @s ri_cat2 run clear @s minecraft:emerald_block 0
execute store result score @s ri_cat1 run clear @s minecraft:diamond_block 0

execute if score @s ri_cat3 matches 1.. run clear @s minecraft:nether_star 1
execute if score @s ri_cat3 matches 1.. run scoreboard players add @s ri_ref_req 50
execute if score @s ri_cat3 matches 1.. run tellraw @s [{text:"[Refinement Catalyst] ",color:"light_purple",bold:true},{text:"Consumed 1x Nether Star (+50% Success Rate Boost)!",color:"aqua"}]

execute if score @s ri_cat3 matches ..0 if score @s ri_cat2 matches 1.. run clear @s minecraft:emerald_block 1
execute if score @s ri_cat3 matches ..0 if score @s ri_cat2 matches 1.. run scoreboard players add @s ri_ref_req 20
execute if score @s ri_cat3 matches ..0 if score @s ri_cat2 matches 1.. run tellraw @s [{text:"[Refinement Catalyst] ",color:"green",bold:true},{text:"Consumed 1x Emerald Block (+20% Success Rate Boost)!",color:"yellow"}]

execute if score @s ri_cat3 matches ..0 if score @s ri_cat2 matches ..0 if score @s ri_cat1 matches 1.. run clear @s minecraft:diamond_block 1
execute if score @s ri_cat3 matches ..0 if score @s ri_cat2 matches ..0 if score @s ri_cat1 matches 1.. run scoreboard players add @s ri_ref_req 15
execute if score @s ri_cat3 matches ..0 if score @s ri_cat2 matches ..0 if score @s ri_cat1 matches 1.. run tellraw @s [{text:"[Refinement Catalyst] ",color:"aqua",bold:true},{text:"Consumed 1x Diamond Block (+15% Success Rate Boost)!",color:"yellow"}]

# Roll 0..99 from server timer + player essence
scoreboard players set #hundred ri_roll 100
scoreboard players operation @s ri_ref_roll = #server ri_timer
scoreboard players add @s ri_ref_roll 513
scoreboard players operation @s ri_ref_roll %= #hundred ri_roll

# Success if ri_ref_roll < ri_ref_req
execute if score @s ri_ref_roll < @s ri_ref_req run function reverend_insanity:give_moon_raiment_gu
execute if score @s ri_ref_roll < @s ri_ref_req run particle minecraft:totem_of_undying ~ ~1.2 ~ 0.5 0.6 0.5 0.1 35
execute if score @s ri_ref_roll < @s ri_ref_req run playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 1.2
execute if score @s ri_ref_roll < @s ri_ref_req run tellraw @s [{text:"[Gu Refinement SUCCESS!] ",color:"gold",bold:true},{text:"Against the odds, you successfully refined and bound [Rank 2] Moon Raiment Gu!",color:"green"}]

# Failure if ri_ref_roll >= ri_ref_req (high failure rate!)
execute if score @s ri_ref_roll >= @s ri_ref_req run particle minecraft:large_smoke ~ ~1.1 ~ 0.4 0.5 0.4 0.05 30
execute if score @s ri_ref_roll >= @s ri_ref_req run particle minecraft:lava ~ ~1.1 ~ 0.3 0.3 0.3 0.05 12
execute if score @s ri_ref_roll >= @s ri_ref_req run playsound minecraft:entity.generic.explode player @s ~ ~ ~ 0.7 0.8
execute if score @s ri_ref_roll >= @s ri_ref_req run damage @s 2 minecraft:magic
execute if score @s ri_ref_roll >= @s ri_ref_req run tellraw @s [{text:"[Gu Refinement FAILED!] ",color:"red",bold:true},{text:"Refinement destabilized! 6 Phantom Membranes, 8 Amethyst Shards, and 85 Essence were lost to backlash. (Tip: Hold Diamond Block [+15%], Emerald Block [+20%], or Nether Star [+50%] to boost success!)",color:"gray"}]
