function ScreenToTileX(_screenX, _screenY)
{
	//first undo arbitrary centering offset (see screeToTileX/Y)
	_screenX -= SCREEN_W * 0.5;
	_screenY -= SCREEN_H * 0.25;
	
	return floor((_screenX / (TILE_W * 0.5) + _screenY / (TILE_H * 0.5)) * 0.5)
}