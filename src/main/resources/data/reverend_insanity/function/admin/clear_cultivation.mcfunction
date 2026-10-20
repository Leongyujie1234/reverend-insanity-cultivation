# Reset @s back to an unawakened mortal and remove all Gu Worms
scoreboard players set @s ri_awakened 0
tag @s remove ri_awakened_player
scoreboard players set @s ri_rank 0
scoreboard players set @s ri_stage 0
scoreboard players set @s ri_aptitude 0
scoreboard players set @s ri_apt_pct 0
scoreboard players set @s ri_essence 0
scoreboard players set @s ri_max_ess 0
scoreboard players set @s ri_wall 0
scoreboard players set @s ri_quest 0
scoreboard players set @s ri_quest_kills 0
scoreboard players set @s ri_slot1 0
scoreboard players set @s ri_slot2 0
scoreboard players set @s ri_slot3 0
scoreboard players set @s ri_slot4 0
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"moonlight_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"liquor_worm"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"white_boar_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"black_boar_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"jade_skin_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"little_light_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"stealth_scales_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"vitality_leaf_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"moonglow_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"four_flavors_liquor_worm"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"white_jade_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"blood_moon_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"moon_raiment_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"earth_communication_ear_grass"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"iron_bone_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"golden_moon_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"chainsaw_golden_centipede"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"sky_canopy_gu"}]
clear @s minecraft:warped_fungus_on_a_stick[minecraft:custom_data~{reverend_insanity_gu:"thunder_wings_gu"}]
playsound minecraft:block.beacon.deactivate player @s ~ ~ ~ 1.0 0.8
tellraw @s [{text:"[Admin] ",color:"red",bold:true},{text:"Your Primeval Aperture, Aptitude, and Gu Worms have been completely cleared and reset to mortal state.",color:"gray"}]

scoreboard players set @s ri_open_book 0
function reverend_insanity:sync_player
