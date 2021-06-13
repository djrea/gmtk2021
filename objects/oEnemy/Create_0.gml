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
	vectorToTether = oTether.directionToTether(posX, posY);
	if abs(vectorToTether[0]) < abs(vectorToTether[1])
	{
		//y direction is larger, head there
		if vectorToTether[1] > 0
			dir = DIRS.UP;
		else
			dir = DIRS.DOWN;
	}
	else
	{
		//x direction is larger, head there
		if vectorToTether[0] > 0
			dir = DIRS.RIGHT;
		else
			dir = DIRS.LEFT;
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