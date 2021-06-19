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
	
	//restrict to the nearest character if projected onto the line outside of the tether
	if projectionX < swordTetherX and projectionX < rangedTetherX
		if swordTetherX < rangedTetherX
			projectionX = swordTetherX;
		else
			projectionX = rangedTetherX;
	else if projectionX > swordTetherX and projectionX > rangedTetherX
		if swordTetherX > rangedTetherX
			projectionX = swordTetherX;
		else
			projectionX = rangedTetherX;
	//now do Y
	if projectionY < swordTetherY and projectionY < rangedTetherY
		if swordTetherY < rangedTetherY
			projectionY = swordTetherY;
		else
			projectionY = rangedTetherY;
	else if projectionY > swordTetherY and projectionY > rangedTetherY
		if swordTetherY > rangedTetherY
			projectionY = swordTetherY;
		else
			projectionY = rangedTetherY;
	
	return [ceil(projectionX), ceil(projectionY)];
}