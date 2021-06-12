function TileToScreenX(_tX, _tY)
{
	return ((_tX - _tY) * (TILE_W * 0.5) + (SCREEN_W*0.5));
}