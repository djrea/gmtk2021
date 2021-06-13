/// @description draw character at its position
///need to make sure it's in the right place isometrically
screenX = TileToScreenX(posX, posY);
screenY = TileToScreenY(posX, posY);

draw_sprite(sprite_index, image_index, screenX, screenY);

//debug move dir
/*var drawWidth = 4;
var drawColour = c_blue;
vectorToTether = oTether.directionToTether(TileToScreenX(posX, posY), TileToScreenY(posX, posY));
tmpX = TileToScreenX(posX, posY);
tmpY = TileToScreenY(posX, posY)
draw_line_width_color(tmpX - vectorToTether[0], vectorToTether[1] + tmpY, tmpX, tmpY, drawWidth, drawColour, drawColour);
*/