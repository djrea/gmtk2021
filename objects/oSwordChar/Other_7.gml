/// @description Events that occur when animations end

//manage attacks
if state == CHAR_STATE.ATTACK || state == CHAR_STATE.RUN_RIGHT || state == CHAR_STATE.RUN_LEFT
{
	stopRunAnimation();
}