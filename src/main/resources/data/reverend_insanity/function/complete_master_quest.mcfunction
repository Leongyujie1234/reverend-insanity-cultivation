# Consume trial tribute (8 Amethyst Shards, 4 Emeralds, 4 Gold Ingots) and reward Hope Gu + 5 Primeval Stones
scoreboard players set @s ri_quest 2
clear @s minecraft:amethyst_shard 8
clear @s minecraft:emerald 4
clear @s minecraft:gold_ingot 4
playsound minecraft:ui.toast.challenge_complete player @s ~ ~ ~ 1.0 1.1
particle minecraft:totem_of_undying ~ ~1.2 ~ 0.5 0.7 0.5 0.1 40
tellraw @s [{text:"You: ",color:"aqua",bold:true},{text:""Master, I have slain the beasts and brought the tribute you demanded."",color:"white"}]
tellraw @s [{text:"Master: ",color:"gold",bold:true},{text:""Good... I see ruthlessness and resolve in your eyes. Take this ",color:"yellow"},{text:"[Hope Gu]",color:"gold",bold:true},{text:" and these ",color:"yellow"},{text:"[Primeval Stones]",color:"aqua",bold:true},{text:". Right-click Hope Gu to awaken your Primeval Aperture—your innate Aptitude will be decided by Heaven itself!"",color:"yellow"}]
function reverend_insanity:give_hope_gu
function reverend_insanity:give_primeval_stone
function reverend_insanity:give_primeval_stone
function reverend_insanity:give_primeval_stone
function reverend_insanity:give_primeval_stone
function reverend_insanity:give_primeval_stone
