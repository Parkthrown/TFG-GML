var toGrab = instance_place(x,y,obj_grabbable);
with(toGrab){
	if (direction_x(other) == other.image_xscale){
		with(other){
			animate(WaxGrab,0,true);
			holding = toGrab.id;
		}
		hsp = 0;
		vsp = 0;
		grabber = other.id;
		state = 0;
		depth = other.depth -1;
		persistent = true;
		return true;
	}
}
return false;