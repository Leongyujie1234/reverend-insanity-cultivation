# reverend_insanity:admin/clear_cultivation_target (MACRO) - resets ALL cultivation progress of the target.
# Usage: /function reverend_insanity:admin/clear_cultivation_target {target:"PlayerName"}
# Works for offline players (scoreboards are name-keyed). Selectors (e.g. @a[tag=x]) also accepted.
$scoreboard players set $(target) ri_rank 0
$scoreboard players set $(target) ri_stage 0
$scoreboard players set $(target) ri_aptitude 0
$scoreboard players set $(target) ri_essence 0
$scoreboard players set $(target) ri_max_ess 0
$scoreboard players set $(target) ri_wall 0
$scoreboard players set $(target) ri_meditate 0
$scoreboard players set $(target) ri_bind_idx 0
$scoreboard players set $(target) ri_satiety 0
$scoreboard players set $(target) ri_light_bst 0
$scoreboard players set $(target) ri_slot1 101
$scoreboard players set $(target) ri_slot2 105
$scoreboard players set $(target) ri_slot3 107
$scoreboard players set $(target) ri_slot4 108
$scoreboard players set $(target) ri_starter 0
$scoreboard players set $(target) ri_action 0
$execute if entity $(target) run tellraw $(target) [{"text":"✦ Your cultivation has been reset by an admin. ","color":"gold","bold":true},{"text":"Awaken again with a Hope Gu.","color":"gray"}]
tellraw @s [{"text":"✓ Cultivation data cleared.","color":"green"}]
