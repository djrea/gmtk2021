/// @description setup SwordChar
#macro SWORD_ATTACK_RADIUS 20
#macro MOVE_RATE 0.2
//radius is from bitmap center (configd in the sprite itself)
// 10px is about the sprite distance of the sword currently
//this extends it about 5px extra

image_index = 0;
image_speed = 0;
state = CHAR_STATE.TOWARDS
