/// @description particles
// You can write your code in this editor
alarm_set(7,25);
switch(state){
case states.Airborne:
switch(subState){
	case airStates.WallRun:
		var bbox = (image_index == 1) ? bbox_right : bbox_left;
		part_particles_create(global.part_system_front,bbox,y,obj_partManager.partSmallDust,1);
		alarm_set(waxAlarms.particles,5);
	break;
	default:
		if(jumpCount >= maxJumps){
			part_particles_create_color(global.part_system_front,x,y,obj_partManager.partStar,c_black,1);
		}
		alarm_set(waxAlarms.particles,10);
	break;
}
break;
case states.OnGround:
switch(subState){
	default:
		if(abs(hsp) > 0.5){
			if(sprite_index == waxDashEnd){
				part_particles_create(global.part_system_front,x,bbox_bottom,obj_partManager.partDust,1);	
				alarm_set(waxAlarms.particles,4);
			}
			part_particles_create(global.part_system_front,x,bbox_bottom,obj_partManager.partDust,1);				
		}
	break;
	case groundStates.WaveDash: case groundStates.Crouch: case groundStates.Fallen:
		if(round(hsp) != 0){
			part_particles_create(global.part_system_front,x,bbox_bottom,obj_partManager.partDust,1);
			alarm_set(waxAlarms.particles,6);
		}
	break;
}
break;

case states.WallLatch:
	if(jumpCount >= maxJumps){
			part_particles_create_color(global.part_system_front,x,y,obj_partManager.partStar,c_black,1);
	}
	part_particles_create(global.part_system_front,x+(4*image_xscale),y,obj_partManager.partDust,1);
	alarm_set(waxAlarms.particles,4);
break;

case states.Sleepy:
if(sprite_index == WaxWaffleIdle){
	if(!irandom(5)){
		part_particles_create(global.part_system_front,x-4*image_xscale,y,obj_partManager.partSnotBubble,1);
		alarm_set(waxAlarms.particles,55);
	}
}
break;
}

