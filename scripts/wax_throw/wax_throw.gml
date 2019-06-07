
with(holding){
	if(!collide_at(x,y)){
		grabber = 0;
		hsp = other.image_xscale * 2.5;
		vsp = -2;
		state = 1;
		depth = get_depth_map();
		persistent = false;
		other.holding = noone;
		return SUCCESS_CODE;
	}
}
return FAILURE_CODE;