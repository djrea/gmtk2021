/// @description draw character at its position
///need to make sure it's in the right place isometrically

screenX = TileToScreenX(posX, posY);
screenY = TileToScreenY(posX, posY);

draw_sprite(sprite_index, image_index, screenX, screenY);