/// @description init


//returns vector of fromX and fromY to nearest intersection with tether
//assumes screen coords
function directionToTether(fromX, fromY)
{
	vectorX = swordTetherX - rangedTetherX;
	vectorY = swordTetherY - rangedTetherY;
	slope = vectorY / vectorX;
	yInterceptTether = swordTetherY - slope*swordTetherX;
	
	//projection of fromX,fromY onto tether
	//stealing math from https://math.stackexchange.com/questions/1398634/finding-a-perpendicular-vector-from-a-line-to-a-point
	projectionX = (fromX + slope*(fromY-yInterceptTether))/(1+slope*slope);
	projectionY = slope * ( projectionX ) + yInterceptTether
	
	return [fromX - projectionX, fromY - projectionY];
}