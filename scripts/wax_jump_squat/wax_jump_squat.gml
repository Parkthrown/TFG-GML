if(!collide_at(x,y-TILE_SIZE)){
	setState(states.OnGround,groundStates.JumpSquat);
	sprite_index = WaxJumpSquat;
	image_index = 0;
	return SUCCESS_CODE;
}
return FAILURE_CODE;


