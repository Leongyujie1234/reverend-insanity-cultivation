# Cycle-bind Black Boar Gu into Active Gu Slots 1..4
scoreboard players add @s ri_bind_idx 1
execute if score @s ri_bind_idx matches 5.. run scoreboard players set @s ri_bind_idx 1
execute if score @s ri_bind_idx matches ..0 run scoreboard players set @s ri_bind_idx 1
execute if score @s ri_bind_idx matches 1 run scoreboard players set @s ri_slot1 104
execute if score @s ri_bind_idx matches 2 run scoreboard players set @s ri_slot2 104
execute if score @s ri_bind_idx matches 3 run scoreboard players set @s ri_slot3 104
execute if score @s ri_bind_idx matches 4 run scoreboard players set @s ri_slot4 104
playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1.0 1.4
tellraw @s [{text:"✦ Equipped ",color:"green"},{text:"[Rank 1] Black Boar Gu",color:"gray",bold:true},{text:" into Active Slot #",color:"gray"},{score:{name:"@s",objective:"ri_bind_idx"},color:"gold",bold:true},{text:"!",color:"gray"}]
