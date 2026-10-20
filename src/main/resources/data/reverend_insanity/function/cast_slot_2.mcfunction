# Execute Gu bound to Active Slot 2 (defaults to code 105 if unbound)
execute if score @s ri_slot2 matches ..0 run tellraw @s [{text:"[Aperture] Gu Slot #2 is empty! Refine a Gu Worm in the Refinement Scroll [P] and equip it first.",color:"red"}]
execute if score @s ri_slot2 matches 101 run function reverend_insanity:cast/code_101
execute if score @s ri_slot2 matches 102 run function reverend_insanity:cast/code_102
execute if score @s ri_slot2 matches 103 run function reverend_insanity:cast/code_103
execute if score @s ri_slot2 matches 104 run function reverend_insanity:cast/code_104
execute if score @s ri_slot2 matches 105 run function reverend_insanity:cast/code_105
execute if score @s ri_slot2 matches 106 run function reverend_insanity:cast/code_106
execute if score @s ri_slot2 matches 107 run function reverend_insanity:cast/code_107
execute if score @s ri_slot2 matches 108 run function reverend_insanity:cast/code_108
execute if score @s ri_slot2 matches 201 run function reverend_insanity:cast/code_201
execute if score @s ri_slot2 matches 202 run function reverend_insanity:cast/code_202
execute if score @s ri_slot2 matches 203 run function reverend_insanity:cast/code_203
execute if score @s ri_slot2 matches 204 run function reverend_insanity:cast/code_204
execute if score @s ri_slot2 matches 205 run function reverend_insanity:cast/code_205
execute if score @s ri_slot2 matches 206 run function reverend_insanity:cast/code_206
execute if score @s ri_slot2 matches 207 run function reverend_insanity:cast/code_207
execute if score @s ri_slot2 matches 301 run function reverend_insanity:cast/code_301
execute if score @s ri_slot2 matches 302 run function reverend_insanity:cast/code_302
execute if score @s ri_slot2 matches 303 run function reverend_insanity:cast/code_303
execute if score @s ri_slot2 matches 304 run function reverend_insanity:cast/code_304
