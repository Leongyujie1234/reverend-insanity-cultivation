# Reverend Insanity Cultivation (Rank 1-3) - Server Engine (Minecraft 26.1.2)
gamerule sendCommandFeedback false
gamerule commandBlockOutput false
scoreboard objectives add ri_awakened dummy "Aperture Awakened (One-Time)"
scoreboard objectives add ri_rank dummy "Cultivation Rank"
scoreboard objectives add ri_stage dummy "Cultivation Stage"
scoreboard objectives add ri_aptitude dummy "Aptitude Grade (1=D, 2=C, 3=B, 4=A)"
scoreboard objectives add ri_apt_pct dummy "Exact Aptitude Percentage (20-99%)"
scoreboard objectives add ri_roll dummy "Random Roll Temp"
scoreboard objectives add ri_essence dummy "Primeval Essence"
scoreboard objectives add ri_max_ess dummy "Max Primeval Essence"
scoreboard objectives add ri_regen_sec dummy "Slow Regen Second Counter"
scoreboard objectives add ri_wall dummy "Aperture Wall Fissure"
scoreboard objectives add ri_mod_client dummy "Qualified Spirit Root"
scoreboard objectives add ri_quest dummy "Master NPC Quest State"
scoreboard objectives add ri_master_seen dummy "Notified of Master Location"
scoreboard objectives add ri_talk_npc minecraft.custom:minecraft.talked_to_villager "Talked to Master"
scoreboard objectives add ri_quest_kills minecraft.custom:minecraft.mob_kills "Quest Mob Kills"
scoreboard objectives add ri_cnt_ame dummy "Amethyst Shard Count"
scoreboard objectives add ri_cnt_eme dummy "Emerald Count"
scoreboard objectives add ri_cnt_gld dummy "Gold Ingot Count"
scoreboard objectives add ri_mat1 dummy "Refinement Material 1 Count"
scoreboard objectives add ri_mat2 dummy "Refinement Material 2 Count"
scoreboard objectives add ri_cat1 dummy "Catalyst Diamond Block Count"
scoreboard objectives add ri_cat2 dummy "Catalyst Emerald Block Count"
scoreboard objectives add ri_cat3 dummy "Catalyst Nether Star Count"
scoreboard objectives add ri_ref_req dummy "Refinement Success Threshold"
scoreboard objectives add ri_ref_roll dummy "Refinement Roll (0-99)"
scoreboard objectives add ri_proj_age dummy "Flying Projectile Lifetime"
scoreboard objectives add ri_light_bst dummy "Little Light Boost"
scoreboard objectives add ri_chainsaw_t dummy "Active Chainsaw Physics Ticks"
scoreboard objectives add ri_timer dummy "Server Tick Counter"
scoreboard objectives add ri_action trigger "Reverend Insanity Action"
scoreboard objectives add ri_rightclick minecraft.used:minecraft.warped_fungus_on_a_stick "Right Click Gu"
scoreboard objectives add ri_sneak minecraft.custom:minecraft.sneak_time "Sneak Time"
scoreboard players set #hundred ri_roll 100
scoreboard players set #eighty ri_roll 80
scoreboard players set #five ri_roll 5
scoreboard players set #twentyfive ri_roll 25
