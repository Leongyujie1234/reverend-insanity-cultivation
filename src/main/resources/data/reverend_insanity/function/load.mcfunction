# Reverend Insanity Cultivation Engine (Minecraft 26.1.2)
gamerule minecraft:send_command_feedback false
gamerule minecraft:command_block_output false
gamerule send_command_feedback false
gamerule command_block_output false
scoreboard objectives add ri_awakened dummy
scoreboard objectives add ri_rank dummy
scoreboard objectives add ri_substage dummy
scoreboard objectives add ri_aptitude dummy
scoreboard objectives add ri_apt_pct dummy
scoreboard objectives add ri_essence dummy
scoreboard objectives add ri_max_essence dummy
scoreboard objectives add ri_break_prog dummy
scoreboard objectives add ri_meditate dummy
scoreboard objectives add ri_tick dummy
scoreboard objectives add ri_regen_cd dummy
scoreboard objectives add ri_proj_t dummy
scoreboard objectives add ri_chainsaw_t dummy
scoreboard objectives add ri_light_bst dummy
scoreboard objectives add ri_kill_ raw_kill_count
scoreboard objectives add ri_kill_tot totalKillCount
scoreboard objectives add ri_q_kills dummy
scoreboard objectives add ri_q_base dummy
scoreboard objectives add ri_q_prog dummy
scoreboard objectives add ri_q_ame dummy
scoreboard objectives add ri_q_eme dummy
scoreboard objectives add ri_q_gld dummy
scoreboard objectives add ri_mat1 dummy
scoreboard objectives add ri_mat2 dummy
scoreboard objectives add ri_roll dummy
scoreboard objectives add ri_succ_rate dummy
scoreboard objectives add ri_open_book dummy
scoreboard objectives add ri_book_t dummy
scoreboard objectives add ri_sync dummy
scoreboard objectives add ri_tmp dummy
scoreboard objectives add ri_rc minecraft.used:minecraft.warped_fungus_on_a_stick
scoreboard objectives add ri_talk minecraft.custom:minecraft.talked_to_villager
scoreboard objectives add ri_action trigger {"text":"Reverend Insanity Action"}
scoreboard objectives setdisplay list ri_sync
