/// @description Events that occur when animations end

//manage attacks
if state == CHAR_STATE.ATTACK 
{
	show_debug_message("HI");
	state = CHAR_STATE.TOWARDS;
	sprite_index = sSwordChar;
	image_index = 0;
	image_speed = 0;
}