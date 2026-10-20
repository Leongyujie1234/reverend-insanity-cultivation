# Master & Disciple Dialogue and Trial Verification:
# Trial Requirements:
#   - Slay 10 creatures/monsters (ri_quest_kills >= 10)
#   - Gather 8 Amethyst Shards, 4 Emeralds, and 4 Gold Ingots

# State 2: Already completed the trial
execute if score @s ri_quest matches 2 run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 1.0 0.9
execute if score @s ri_quest matches 2 run tellraw @s [{text:"You: ",color:"aqua",bold:true},{text:""Master, I seek guidance on the path of cultivation."",color:"white"}]
execute if score @s ri_quest matches 2 run tellraw @s [{text:"Master: ",color:"gold",bold:true},{text:""Your Aperture is yours alone to cultivate. Press [O] to inspect your Primeval Sea and smash your Aperture Walls, and press [P] to refine Gu Worms."",color:"yellow"}]

# State 1: Check inventory counts of Amethyst Shards (8), Emeralds (4), and Gold Ingots (4) + 10 Mob Kills
execute if score @s ri_quest matches 1 store result score @s ri_cnt_ame run clear @s minecraft:amethyst_shard 0
execute if score @s ri_quest matches 1 store result score @s ri_cnt_eme run clear @s minecraft:emerald 0
execute if score @s ri_quest matches 1 store result score @s ri_cnt_gld run clear @s minecraft:gold_ingot 0

# If all 4 requirements are met -> Complete the trial!
execute if score @s ri_quest matches 1 if score @s ri_quest_kills matches 10.. if score @s ri_cnt_ame matches 8.. if score @s ri_cnt_eme matches 4.. if score @s ri_cnt_gld matches 4.. run function reverend_insanity:complete_master_quest

# If still in State 1 (meaning at least one requirement was not met) -> Report exact progress
execute if score @s ri_quest matches 1 run playsound minecraft:entity.villager.no player @s ~ ~ ~ 1.0 0.8
execute if score @s ri_quest matches 1 run tellraw @s [{text:"You: ",color:"aqua",bold:true},{text:""Master, I have returned from the trial."",color:"white"}]
execute if score @s ri_quest matches 1 run tellraw @s [{text:"Master: ",color:"gold",bold:true},{text:""Your offerings are incomplete! Return only when you have fulfilled every condition:"",color:"red"}]
execute if score @s ri_quest matches 1 run tellraw @s [{text:"  • Creatures Slain: ",color:"gray"},{score:{name:"@s",objective:"ri_quest_kills"},color:"yellow"},{text:"/10  |  Amethyst Shards: ",color:"gray"},{score:{name:"@s",objective:"ri_cnt_ame"},color:"light_purple"},{text:"/8  |  Emeralds: ",color:"gray"},{score:{name:"@s",objective:"ri_cnt_eme"},color:"green"},{text:"/4  |  Gold Ingots: ",color:"gray"},{score:{name:"@s",objective:"ri_cnt_gld"},color:"gold"},{text:"/4",color:"gray"}]

# State 0 (Not started yet) -> Begin Trial and set ri_quest = 1
execute unless score @s ri_quest matches 1.. run scoreboard players set @s ri_quest 1
execute if score @s ri_quest matches 1 if score @s ri_quest_kills matches ..0 run scoreboard players set @s ri_quest_kills 0
execute if score @s ri_quest matches 1 if score @s ri_quest_kills matches 0 if score @s ri_cnt_ame matches ..0 run playsound minecraft:block.enchantment_table.use player @s ~ ~ ~ 1.0 0.9
execute if score @s ri_quest matches 1 if score @s ri_quest_kills matches 0 if score @s ri_cnt_ame matches ..0 run tellraw @s [{text:"You: ",color:"aqua",bold:true},{text:""Master, I wish to awaken my Aperture and tread the path of a Gu Master."",color:"white"}]
execute if score @s ri_quest matches 1 if score @s ri_quest_kills matches 0 if score @s ri_cnt_ame matches ..0 run tellraw @s [{text:"Master: ",color:"gold",bold:true},{text:""Man is the spirit of all living beings; Gu are the essence of Heaven and Earth. Yet the road of cultivation is paved with blood and tribute."",color:"yellow"}]
execute if score @s ri_quest matches 1 if score @s ri_quest_kills matches 0 if score @s ri_cnt_ame matches ..0 run tellraw @s [{text:"Master: ",color:"gold",bold:true},{text:""Prove your worth first: slay ",color:"gray"},{text:"10 creatures",color:"red",bold:true},{text:" in the wild, and bring me ",color:"gray"},{text:"8 Amethyst Shards",color:"light_purple",bold:true},{text:", ",color:"gray"},{text:"4 Emeralds",color:"green",bold:true},{text:", and ",color:"gray"},{text:"4 Gold Ingots",color:"gold",bold:true},{text:". Only then shall I bestow the ",color:"gray"},{text:"Hope Gu",color:"yellow",bold:true},{text:" upon you!"",color:"gray"}]
