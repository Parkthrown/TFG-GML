/// @description Insert description here
// You can write your code in this editor

switch(state){
	case 0:
		if(!isGrounded() && alarm[0] > 1){
			alarm_set(0,1);
		}
	break;
	case 1:
		if(collide_at(x,y+vsp)){
			var count = 0;
			while(count < abs(vsp)){
				if(collide_at(x,y+sign(vsp))) break;
				y+=sign(vsp);
				count++;
			}
			vsp = 0;
			hsp = 0;
			state = 0;
			if(TIMER&1) image_xscale = -image_xscale;
		}
		x+=hsp;
		y+=vsp;
		vsp += 0.1;
	break;
	case 2:
		x+=hsp;
		y+=vsp;
	break;
}

var p = instance_nearest(x,y,obj_player);
if(instance_exists(p) && distance_to_object(p) < TILE_SIZE*4 && (abs(p.hsp)+abs(p.vsp)) >= 1 ){
	alarm_set(0,-1);
	state = 2;
	sprite_index = spr_birdFly;
	set_speed_from_angle((image_xscale) ? (pi/4)*3 : pi/4,2.2);
}