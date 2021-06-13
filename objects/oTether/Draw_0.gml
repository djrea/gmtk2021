/// @description Insert description here
// 
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

var swordCharScreenX = TileToScreenX(swordCharX, swordCharY);
var swordCharScreenY = TileToScreenY(swordCharX, swordCharY) - swordCharOffsetY;
var rangedCharScreenX = TileToScreenX(rangedCharX, rangedCharY);
var rangedCharScreenY = TileToScreenY(rangedCharX, rangedCharY) - rangedCharOffsetY;

draw_line_width_color(swordCharScreenX, swordCharScreenY, rangedCharScreenX, rangedCharScreenY, 3, c_red, c_red);