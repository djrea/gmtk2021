/// @description randomish movement

if state == ENEMY_STATE.MOVING
{
	if dir == DIRS.LEFT
	{
		x -= ENEMY_MOVE_RATE;
	}
	if dir == DIRS.RIGHT
	{
		x += ENEMY_MOVE_RATE;
	}
	if dir == DIRS.UP
	{
		y -= ENEMY_MOVE_RATE;
	}
	if dir == DIRS.DOWN
	{
		y += ENEMY_MOVE_RATE;
	}
}
else
{
	image_speed = 0;
}