# Summon the 'Master' Cultivation Elder ON TOP of the ground with normal AI & gravity so he walks and reacts!
kill @e[tag=ri_master_interact,distance=..6]
summon minecraft:wandering_trader ~ ~ ~ {Tags:["ri_master_npc"],CustomName:{text:"Master",color:"gold",bold:true},CustomNameVisible:1b,Invulnerable:1b,PersistenceRequired:1b,DespawnDelay:2147483647,Glowing:1b,Offers:{Recipes:[]}}
particle minecraft:end_rod ~ ~1.2 ~ 0.4 0.8 0.4 0.04 25
