function KeyboardInput()
{
	// @description Input Handler
	show_debug_message("HI");
	if keyboard_check(ord("a")) //left
		charX -= 1;
	if keyboard_check(ord("d")) //right
		charX += 1;
	if keyboard_check(ord("w")) //up
		charY -= 1;
	if keyboard_check(ord("s")) //down
		charY += 1;
}