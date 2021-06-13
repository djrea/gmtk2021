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