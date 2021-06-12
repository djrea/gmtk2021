/// @description draw character at its position
///need to make sure it's in the right place isometrically

screenX = TileToScreenX(charX, charY);
screenY = TileToScreenY(charX, charY);

var sprite = sSwordChar;
if state == CHAR_STATE.ATTACK
	sprite = sSwordAttackAniRight;

draw_sprite(sprite, image_index, screenX, screenY);