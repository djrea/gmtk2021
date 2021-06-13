/// @description Input Handler

if keyboard_check_pressed(ord("A")) //left
	charX -= 1;
if keyboard_check_pressed(ord("D")) //right
	charX += 1;
if keyboard_check_pressed(ord("W")) //up
	charY -= 1;
if keyboard_check_pressed(ord("S")) //down
	charY += 1;
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
		enemyInstance.image_index = 0;
	}
	
}

/// hacky find all instances of a type nearby and swap their sprite tile
function checkHitSword()
{
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
		    if (_list[i] && point_distance(_list[i].x, _list[i].y, _x, _y) <= _radius)
			{
				//hit, do something to them
				_list[i].image_index = 1;
			}
		}
	}
}