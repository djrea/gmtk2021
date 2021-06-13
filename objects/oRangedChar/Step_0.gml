/// @description Input Handler

if(playerActive){
	if (keyboard_check(ord("A")) || keyboard_check(ord("H"))){ //left
		newCharX = charX - MOVE_RATE * 0.5;
		newCharY = charY + MOVE_RATE * 0.5;
		rangedRunLeft();
	}
	if (keyboard_check(ord("D")) || keyboard_check(ord("N"))){ //right
		newCharX = charX + MOVE_RATE * 0.5;
		newCharY = charY - MOVE_RATE * 0.5;
		rangedRunRight();
	}
	if (keyboard_check(ord("W")) || keyboard_check(ord("C"))){ //up
		newCharX = charX - MOVE_RATE;
		newCharY = charY - MOVE_RATE;
		rangedRunLeft();
	}
	if (keyboard_check(ord("S")) || keyboard_check(ord("T"))){ //down
		newCharX = charX + MOVE_RATE;
		newCharY = charY + MOVE_RATE;
		rangedRunRight();
	}
	//this does the actual moving/checking if they can move
	if state == CHAR_STATE.RUN_LEFT || state == CHAR_STATE.RUN_RIGHT
	{
		newPos = oRender.moveRestrictedToTiles(charX, charY, newCharX, newCharY, RANGED_MANTLE_HEIGHT)
		charX = newPos[0];
		charY = newPos[1];
	}
	if keyboard_check_released(ord("W")) ||	
		keyboard_check_released(ord("C")) ||
		keyboard_check_released(ord("A")) ||
		keyboard_check_released(ord("H")) ||
		keyboard_check_released(ord("S")) ||
		keyboard_check_released(ord("T")) ||
		keyboard_check_released(ord("D")) ||
		keyboard_check_released(ord("N")) 
	{
		stopRunAnimation();
	}
	if mouse_check_button_pressed(mb_left) //attack
	{
		state = CHAR_STATE.ATTACK;
		image_index = 0;
		image_speed = 1;

		if charX > ScreenToTileX(mouse_x, mouse_y)
			sprite_index = sRangedAttackAniLeft;
		else
			sprite_index = sRangedAttackAniRight;
		
		checkHitSword();
	}
}

function stopRunAnimation()
{
	state = CHAR_STATE.TOWARDS;
	sprite_index = sRangedChar;
	image_index = 0;
	image_speed = 0;
}

function rangedRunRight()
{
	if state == CHAR_STATE.ATTACK
		return;
	if(state != CHAR_STATE.RUN_RIGHT)
	{
		state = CHAR_STATE.RUN_RIGHT;
		sprite_index = sRangedRunRight;
		image_speed = 1;
	}
}

function rangedRunLeft()
{
	if state == CHAR_STATE.ATTACK
		return;
	if(state != CHAR_STATE.RUN_LEFT)
	{
		state = CHAR_STATE.RUN_LEFT;
		sprite_index = sRangedRunLeft;
		image_speed = 1;
	}
}

/// hacky find all instances of a type nearby and swap their sprite tile
function checkHitSword()
{
	//TODO: include width of self in calculation?
	//this assumes sprite center is at bottom mid of sprite
	//and assumes attack radius should calc from centre of sprite
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
		    if (_list[i] && point_distance(abs(_list[i].x - _x), 
										abs(_list[i].y - _y) - spriteHeight/2, 0, 0) <= _radius)
				//note since sprite is already centered, don't need to adjust x to half of sprite
			{
				//hit, do something to them
				_list[i].sprite_index = sDED_ENEMY;
			}
		}
	}
}