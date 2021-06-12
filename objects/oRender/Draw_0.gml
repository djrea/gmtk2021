/// @description Render game

var tileData, screenX, screenY, tileIndex, tileZ;

for(var tX = 0; tX < MAP_W; tX++)
{
	for(var tY = 0; tY < MAP_H; tY++)
	{
		tileData = global.theMap[# tX, tY];
		screenX = TileToScreenX(tX, tY);
		screenY = TileToScreenY(tX, tY);
		
		tileIndex = tileData[TILE.SPRITE];
		tileZ = tileData[TILE.Z];
		
		var sprite = sStatic;
		
		//get mouseTile
		if( ScreenToTileX(mouse_x, mouse_y) == tX && (ScreenToTileY(mouse_x, mouse_y) == tY) )
		{
			sprite = tileHover;
			tileIndex = 2;
			tileZ -= 5;
		}
		
		if(0 != tileIndex)
		{
			draw_sprite(sprite, tileIndex-1, screenX, screenY + tileZ);
		}
		
	}
}