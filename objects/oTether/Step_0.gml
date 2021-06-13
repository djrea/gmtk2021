if(firstFrame){
	firstFrame = false;
}else{
	updateTetherPosition();
	checkTetherEnemyCollision();
	if(keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("G"))){
		swapPlayerControl();
	}
	if keyboard_check_pressed(ord("R")){ //down
		resetEnemies();
	}
}
//end of step

function swapPlayerControl(){
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
}//-------

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
	
}//-------

function updateTetherPosition(){
	var swordCharX = -1;
	var swordCharY = -1;
	var rangedCharX = -1;
	var rangedCharY = -1;
	var swordCharOffsetY = -1;
	var rangedCharOffsetY = -1;

	var swordChar = [oSwordChar];
	for(var a = 0; a < array_length_1d(swordChar); a++){
		swordCharX = swordChar[a].charX;
		swordCharY = swordChar[a].charY;
		swordCharOffsetY = (sprite_get_height(swordChar[a].sprite_index) * 0.5 );
	}
	var rangedChar = [oRangedChar];
	for(var a = 0; a < array_length_1d(rangedChar); a++){
		rangedCharX = rangedChar[a].charX;
		rangedCharY = rangedChar[a].charY;
		rangedCharOffsetY = (sprite_get_height(rangedChar[a].sprite_index) * 0.5);
	}

	swordTetherX = TileToScreenX(swordCharX, swordCharY);
	swordTetherY = TileToScreenY(swordCharX, swordCharY) - swordCharOffsetY;
	rangedTetherX = TileToScreenX(rangedCharX, rangedCharY);
	rangedTetherY = TileToScreenY(rangedCharX, rangedCharY) - rangedCharOffsetY;
}//---------

function checkTetherEnemyCollision(){
	tetherHit = false;
	var enemyObjectType = [oEnemy];
	var enemyObjectTypeSize = array_length_1d(enemyObjectType);
	for(var a = 0; a < enemyObjectTypeSize; a++){
		// First, make a list of all instances of the given type
		var enemyType = enemyObjectType[a];
		var num = instance_number(enemyType);
		//var enemyList;
		for (var b = 0; b < num; b++ ){
		    var enemyInstance = instance_find(enemyType, b);
			var collision = collision_line(swordTetherX, swordTetherY, rangedTetherX, rangedTetherY, enemyInstance, false, false);
			if(collision){
				//enemyInstance.sprite_index = sDED_ENEMY;
				tetherHit = true;
			}else{
				//enemyInstance.sprite_index = sTMP_ENEMY;
			}
		}
	}
}//--------