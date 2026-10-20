# If mortal (ri_awakened == 0) and not opening a book, ri_sync = 0
execute unless score @s ri_awakened matches 1.. unless score @s ri_open_book matches 1.. run scoreboard players set @s ri_sync 0
execute if score @s ri_awakened matches 1.. run function reverend_insanity:sync_player_active
execute unless score @s ri_awakened matches 1.. if score @s ri_open_book matches 1.. run function reverend_insanity:sync_player_book_only
