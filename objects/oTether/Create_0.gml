/// @description init


//returns vector of fromX and fromY to nearest intersection with tether
//assumes screen coords
//returns closest point on tether
function directionToTether(fromX, fromY)
{
	vectorX = swordTetherX - rangedTetherX; //xTether is screen
	vectorY = swordTetherY - rangedTetherY; //xChar is tile
	slope = vectorY / vectorX;
	yInterceptTether = swordTetherY - slope*swordTetherX; //could use any x,y pair on the line
	
	//projection of fromX,fromY onto tether
	//stealing math from https://math.stackexchange.com/questions/1398634/finding-a-perpendicular-vector-from-a-line-to-a-point
	projectionX = 1.0*(fromX + slope*(fromY-yInterceptTether))/(1+slope*slope);
	projectionY = slope * ( projectionX ) + yInterceptTether
	
	return [projectionX, projectionY];
}