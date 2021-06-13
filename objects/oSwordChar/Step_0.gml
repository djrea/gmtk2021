/// @description Input Handler

//A and D are scaled because you technically move farther with them
if keyboard_check(ord("A")) //left
{
	charX -= SWORD_CHAR_MOVE_RATE * 0.5;
	charY += SWORD_CHAR_MOVE_RATE * 0.5;
}
if keyboard_check(ord("D")) //right
{
	charX += SWORD_CHAR_MOVE_RATE * 0.5;
	charY -= SWORD_CHAR_MOVE_RATE * 0.5;
}
if keyboard_check(ord("W")) //up
{
	charX -= SWORD_CHAR_MOVE_RATE;
	charY -= SWORD_CHAR_MOVE_RATE;
}
if keyboard_check(ord("S")) //down
{
	charX += SWORD_CHAR_MOVE_RATE;
	charY += SWORD_CHAR_MOVE_RATE;
}
if keyboard_check_pressed(ord("R")) //down
	resetEnemies();

if mouse_check_button_pressed(mb_left) //attack
{
	state = CHAR_STATE.ATTACK;
	image_index = 0;
	image_speed = 1;

	if charX > ScreenToTileX(mouse_x, mouse_y)
		sprite_index = sSwordAttackAniLeft;
	else
		sprite_index = sSwordAttackAniRight;
		
	checkHitSword();
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
	_radius = SWORD_ATTACK_RADIUS;
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