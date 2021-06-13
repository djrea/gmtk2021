/// @description instantiate
#macro ENEMY_MOVE_ALARM_SPEED room_speed*2
#macro ENEMY_MOVE_RATE 0.01
state = ENEMY_STATE.DEFAULT;
dir = DIRS.DEFAULT;

enum ENEMY_STATE
{
	DEFAULT,
	MOVING
}

alarm_set(0, ENEMY_MOVE_ALARM_SPEED);


function chooseDirection()
{
	dir = irandom(DIRS.NUM_DIRS);
	if dir == DIRS.DEFAULT //take a break
	{
		alarm_set(0, ENEMY_MOVE_ALARM_SPEED);
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