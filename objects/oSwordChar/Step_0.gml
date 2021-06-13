/// @description Input Handler

if(playerActive){
	if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(ord("H"))){ //left
		charX -= MOVE_RATE * 0.5;
	if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(ord("N"))){ //right
		charX += MOVE_RATE * 0.5;
		charY -= MOVE_RATE * 0.5;
	}
	if (keyboard_check_pressed(ord("W")) || keyboard_check_pressed(ord("C"))){ //up
		charX -= MOVE_RATE;
		charY -= MOVE_RATE;
	}
	if (keyboard_check_pressed(ord("S")) || keyboard_check_pressed(ord("T"))){ //down
		charX += MOVE_RATE;
		charY += MOVE_RATE;
	}
	if mouse_check_button_pressed(mb_left) //attack
	{
		state = CHAR_STATE.ATTACK;
		image_index = 0;
		image_speed = 1;
		charY += MOVE_RATE * 0.5;
	}
	swordRunLeft();
	swordRunRight();
	swordRunRight();
	swordRunLeft();
if keyboard_check_released(ord("W")) ||
	keyboard_check_released(ord("A")) ||
	keyboard_check_released(ord("S")) ||
	keyboard_check_released(ord("D")) 
{
	stopRunAnimation();
}
if keyboard_check_pressed(ord("R")) //down
	resetEnemies();

		if charX > ScreenToTileX(mouse_x, mouse_y)
			sprite_index = sSwordAttackAniLeft;
		else
			sprite_index = sSwordAttackAniRight;
		
		checkHitSword();
	}
}

function stopRunAnimation()
{
	state = CHAR_STATE.TOWARDS;
	sprite_index = sSwordChar;
	image_index = 0;
	image_speed = 0;
}

function swordRunRight()
{
	if state == CHAR_STATE.ATTACK
		return;
	if(state != CHAR_STATE.RUN_RIGHT)
	{
		state = CHAR_STATE.RUN_RIGHT;
		sprite_index = sSwordRunRight;
		image_speed = 1;
	}
}

function swordRunLeft()
{
	if state == CHAR_STATE.ATTACK
		return;
	if(state != CHAR_STATE.RUN_LEFT)
	{
		state = CHAR_STATE.RUN_LEFT;
		sprite_index = sSwordRunLeft;
		image_speed = 1;
	}
}

function resetEnemies()
{
	_num = instance_number(oEnemy);
	// First, make a list of all instances of the given type
	for (var i = 0; i < _num; i++ )
	{
	    enemyInstance = instance_find(oEnemy, i);
		enemyInstance.sprite_index = sTMP_ENEMY;
		enemyInstance.state = ENEMY_STATE.DEFAULT;
		enemyInstance.alarm_set(0, ENEMY_MOVE_ALARM_SPEED);
	}
	
}

/// hacky find all instances of a type nearby and swap their sprite tile
function checkHitSword()
{
	//TODO: include with of self in calculation?
	_x = TileToScreenX(charX, charY);
	_y = TileToScreenY(charX, charY);
	_enemyTypes = [oEnemy];
	_radius = ATTACK_RADIUS;
	_inst = noone;
	
	for(var typeCount = 0; typeCount < array_length_1d(_enemyTypes); typeCount++)
	{
		_enemyType = _enemyTypes[typeCount];
		_num = instance_number(_enemyType);

		// First, make a list of all instances of the given type
		for (var i = 0; i < _num; i++ )
		    _list[i] = instance_find(_enemyType, i);

		// Then, deactivate all instances inside the given radius
		for (var i = 0; i < _num; i++ )
		{
			spriteWidth = sprite_get_width(_list[i].sprite_index);
			spriteHeight = sprite_get_height(_list[i].sprite_index);
		    if (_list[i] && point_distance(abs(_list[i].x - _x) - spriteWidth/2, 
										abs(_list[i].y - _y) - spriteHeight/2, 0, 0) <= _radius)
			{
				//hit, do something to them
				_list[i].sprite_index = sDED_ENEMY;
			}
		}
	}
}