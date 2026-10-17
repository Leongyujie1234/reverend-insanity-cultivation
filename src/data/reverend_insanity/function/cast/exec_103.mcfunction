scoreboard players remove @s ri_essence 20
effect give @s minecraft:strength 35 0 true
effect give @s minecraft:speed 20 0 true
particle minecraft:dust{color:[0.96,0.95,0.90],scale:2.0} ~ ~1.6 ~ 0.5 0.4 0.5 0 28
particle minecraft:cloud ^ ^1.1 ^1.8 0.4 0.3 0.4 0.06 18
execute positioned ^ ^1.0 ^2.2 as @e[distance=..2.8,type=!player,limit=2] run damage @s 5 minecraft:player_attack by @p
playsound minecraft:entity.hoglin.angry player @s ~ ~ ~ 1.0 1.15
tellraw @s [{text:"✦ White Boar Gu ",color:"white",bold:true},{text:"manifests a charging white boar phantom above you (+Strength I & Tusk Charge)!",color:"gray"}]
