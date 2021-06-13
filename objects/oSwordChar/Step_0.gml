/// @description Input Handler

if(playerActive){
	if (keyboard_check(ord("A")) || keyboard_check(ord("H"))){ //left
		newCharX = charX - MOVE_RATE * 0.5;
		newCharY = charY + MOVE_RATE * 0.5;
		swordRunLeft();
	}
	if (keyboard_check(ord("D")) || keyboard_check(ord("N"))){ //right
		newCharX = charX + MOVE_RATE * 0.5;
		newCharY = charY - MOVE_RATE * 0.5;
		swordRunRight();
	}
	if (keyboard_check(ord("W")) || keyboard_check(ord("C"))){ //up
		newCharX = charX - MOVE_RATE;
		newCharY = charY - MOVE_RATE;
		swordRunRight();
	}
	if (keyboard_check(ord("S")) || keyboard_check(ord("T"))){ //down
		newCharX = charX + MOVE_RATE;
		newCharY = charY + MOVE_RATE;
		swordRunLeft();
	}
	//this does the actual moving/checking if they can move
	if state == CHAR_STATE.RUN_LEFT || state == CHAR_STATE.RUN_RIGHT
	{
		newPos = oRender.moveRestrictedToTiles(charX, charY, newCharX, newCharY, SWORD_CHAR_MANTLE_HEIGHT)
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
		{
			sprite_index = sSwordAttackAniLeft;
			dir = DIRS.LEFT;
		}
		else
		{
			dir = DIRS.RIGHT;
			sprite_index = sSwordAttackAniRight;
		}
		checkHitSword(dir);
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

/// hacky find all instances of a type nearby and swap their sprite tile
function checkHitSword(dir)
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

		// Then, check all instances inside the given radius
		for (var i = 0; i < _num; i++ )
		{
			//only hit facing the right way
			if (dir == DIRS.LEFT && _list[i].x - _x > 0) //looking left, enemy right
				|| (dir == DIRS.RIGHT && _list[i].x - _x < 0) //looking right, enemy left
				continue; //skip this enemy
				
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