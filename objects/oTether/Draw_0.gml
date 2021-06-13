/// @description Insert description here
// 
var drawColour = c_yellow;
if(tetherHit){
	drawColour = c_red;	
}
var drawWidth = 4;
if(tetherHit){
	drawWidth = 2;	
}
draw_line_width_color(swordTetherX, swordTetherY, rangedTetherX, rangedTetherY, drawWidth, drawColour, drawColour);