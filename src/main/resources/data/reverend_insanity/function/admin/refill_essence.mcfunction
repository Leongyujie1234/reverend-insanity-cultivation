scoreboard players operation @s ri_essence = @s ri_max_ess
tellraw @s [{text:"[Admin] ",color:"aqua",bold:true},{text:"Primeval Sea refilled to maximum capacity!",color:"green"}]

scoreboard players set @s ri_open_book 0
function reverend_insanity:sync_player
