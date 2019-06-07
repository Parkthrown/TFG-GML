with(holding){
	if(!collide_at(x,y)){
	grabber = 0;
	vsp = -1;
	hsp = other.image_xscale;
	other.holding = noone;
	return true;
	}
}
return false;