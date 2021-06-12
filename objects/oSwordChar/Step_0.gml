/// @description Input Handler

if keyboard_check_pressed(ord("A")) //left
	charX -= 1;
if keyboard_check_pressed(ord("D")) //right
	charX += 1;
if keyboard_check_pressed(ord("W")) //up
	charY -= 1;
if keyboard_check_pressed(ord("S")) //down
	charY += 1;
if mouse_check_button_pressed(mb_left) //attack
{
	//TODO attack in the direction of the mouse
	state = CHAR_STATE.ATTACK;
	image_index = 0;
	image_speed = 1;
	sprite_index = sSwordAttackAniRight;
}