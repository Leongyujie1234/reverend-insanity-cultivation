execute as @a run function reverend_insanity:admin/clear_cultivation
data remove storage reverend_insanity:cultivation awakened_players
tellraw @a [{text:"[Admin] ",color:"red",bold:true},{text:"All players' cultivation data and persistent Awakening records have been purged.",color:"yellow"}]
