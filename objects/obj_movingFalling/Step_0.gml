/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var ontop = 0;
if(place_meeting(x,y-1,obj_collisionable)){
	ontop = 1;
}

if(ontop){
	if(alarm[0]<=0 && !open){
		alarm_set(0,120);
	}
	if(alarm[1]<=0){
		alarm_set(1,5);
	}
	
}else{
	if(alarm[0]>=0 && !open){
		alarm[0] = -1;
	}
	image_index = 0;
}
if(open){
	vsp = (type == 3 || type == 2) ? lerp(vsp,realSp,0.1): 0;
	hsp = (type == 3 || type == 1) ? lerp(hsp,realSp,0.1): 0;
	image_index = 1;
}