scoreboard players remove @s ri_essence 250
scoreboard players set @s ri_chainsaw_t 80
playsound minecraft:block.grindstone.use player @s ~ ~ ~ 1.2 0.65
tellraw @s [{text:"✦ Chainsaw Golden Centipede ",color:"gold",bold:true},{text:"extends a roaring 4.5m articulated golden-chain buzzsaw from your arm for 4s!",color:"yellow"}]
function reverend_insanity:cast/chainsaw_tick
