/// @description Input Handler

show_debug_message(charX);
if keyboard_check_pressed(ord("A")) //left
	charX -= 1;
if keyboard_check_pressed(ord("D")) //right
	charX += 1;
if keyboard_check_pressed(ord("W")) //up
	charY -= 1;
if keyboard_check_pressed(ord("S")) //down
	charY += 1;