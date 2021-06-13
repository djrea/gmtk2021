if(keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("G"))){
	var curChar;
	if(playerChar == oSwordChar){
		curChar = playerChar;
		playerChar = oRangedChar;
	}else if(playerChar == oRangedChar){
		curChar = playerChar;
		playerChar = oSwordChar;
	}
	var checkChar = [curChar];
	for(var a = 0; a < array_length_1d(checkChar); a++){
		checkChar[a].playerActive = false;
	}
	checkChar = [playerChar];
	for(var a = 0; a < array_length_1d(checkChar); a++){
		checkChar[a].playerActive = true;
	}
}
if keyboard_check_pressed(ord("R")){ //down
	resetEnemies();
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