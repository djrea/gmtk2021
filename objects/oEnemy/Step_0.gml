/// @description randomish movement

if state == ENEMY_STATE.MOVING
{
	newX = posX;
	newY = posY;
	if dir == DIRS.LEFT
	{
		newX = posX - ENEMY_MOVE_RATE;
	}
	if dir == DIRS.RIGHT
	{
		newX = posX + ENEMY_MOVE_RATE;
	}
	if dir == DIRS.UP
	{
		newY = posY - ENEMY_MOVE_RATE;
	}
	if dir == DIRS.DOWN
	{
		newY = posY + ENEMY_MOVE_RATE;
	}
	//this does the actual moving/checking if they can move
	newPos = oRender.moveRestrictedToTiles(posX, posY, newX, newY, SLIME_MANTLE_HEIGHT)
	posX = newPos[0];
	posY = newPos[1];
}
else
{
	image_speed = 0;
}