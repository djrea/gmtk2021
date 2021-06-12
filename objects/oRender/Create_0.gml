/// @description Insert description here
layer_set_visible("Map", false);

global.theMap = ds_grid_create(MAP_W, MAP_H);

var tileMap = layer_tilemap_get_id("Map");

for(var tX = 0; tX < MAP_W; tX++)
{
	for(var tY = 0; tY < MAP_H; tY++)
	{
		//tileMapData should just be a tile index for basic tiles
		//like flipped tiles etc need more work tile_get_index etc
		var tileMapData = tilemap_get(tileMap, tX, tY); 
		var thisTile = [-1, 0]; //[Sprite, Z]
		thisTile[TILE.SPRITE] = tileMapData;
		thisTile[TILE.Z] = irandom(3);
		//# is the grid ds accessor
		global.theMap[# tX, tY] = thisTile;
	}
}
