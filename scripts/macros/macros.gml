#macro MAP_W 32
#macro MAP_H 24
#macro TILE_W 32
#macro TILE_H 16
#macro SCREEN_W 512
#macro SCREEN_H 384

enum TILE
{
	SPRITE,
	Z
}

enum DIRS
{
	DEFAULT,
	LEFT,
	RIGHT,
	UP,
	DOWN,
	NUM_DIRS
}

enum CHAR_STATE
{
	TOWARDS,
	RUN_RIGHT,
	RUN_LEFT,
	ATTACK
}

function macros(){

}