#macro MAP_W 32
#macro MAP_H 24
#macro TILE_W 16
#macro TILE_H 8
#macro SCREEN_W 512
#macro SCREEN_H 384

#macro SWORD_ATTACK_FRAMES 5
#macro SWORD_ATTACK_RADIUS 20
//radius is from bitmap center (configd in the sprite itself)
// 10px is about the sprite distance of the sword currently
//this extends it about 5px extra

enum TILE
{
	SPRITE,
	Z
}

enum CHAR_STATE
{
	TOWARDS,
	TOWARDS_RIGHT,
	ATTACK
}

function macros(){

}