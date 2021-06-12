/// @description draw character at its position
///need to make sure it's in the right place isometrically

screenX = TileToScreenX(charX, charY);
screenY = TileToScreenY(charX, charY);

draw_sprite(SwordChar, currentAnimTile, screenX, screenY);