/// @description instantiate
#macro ENEMY_MOVE_ALARM_SPEED room_speed*2
#macro ENEMY_MOVE_RATE 0.05
state = ENEMY_STATE.DEFAULT;
dir = DIRS.DEFAULT;

enum ENEMY_STATE
{
	DEFAULT,
	MOVING
}

alarm_set(0, ENEMY_MOVE_ALARM_SPEED*irandom(10)/10.0 +0.1);


function chooseDirection()
{
	vectorToTether = oTether.directionToTether(TileToScreenX(posX, posY), TileToScreenY(posX, posY));
	toTetherTileVectorX = ScreenToTileX(vectorToTether[0], vectorToTether[1]);
	toTetherTileVectorY = ScreenToTileY(vectorToTether[0], vectorToTether[1]);
	show_debug_message(string(toTetherTileVectorX)+", "+string(toTetherTileVectorY))
	if abs(toTetherTileVectorX) < abs(toTetherTileVectorY)
	{
		//y direction is larger, head there
		if toTetherTileVectorY > 0 //tehter -> enemy = up
			dir = DIRS.DOWN;
		else
			dir = DIRS.UP;
	}
	else
	{
		//x direction is larger, head there
		if toTetherTileVectorX > 0 //tether -> enemy = right
			dir = DIRS.LEFT;
		else
			dir = DIRS.RIGHT;
	}
	
	tmpDir = irandom(DIRS.NUM_DIRS);
	if tmpDir == DIRS.DEFAULT //take a break
	{
		alarm_set(0, ENEMY_MOVE_ALARM_SPEED*irandom(10)/10.0 +0.1);
		state = ENEMY_STATE.DEFAULT;
		image_speed = 0;
	}
	else
	{
		state = ENEMY_STATE.MOVING;
		image_speed = 1;
		image_index = 0;
	}
}