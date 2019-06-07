/// @description Horizontal collision
// You can write your code in this editor
#region inputs
if(global.IO[0] == id){
	var movement_horizontal = global.input_movementHorizontal;
}else {
	var movement_horizontal = 0;
}
#endregion
Squash();
switch(state){
	default:
		hsp = 0;
	break;
	case states.OnGround:
		hsp = 0;
	break;
	case states.Airborne:
		if(movement_horizontal == image_xscale){
			if((floor(bbox_bottom) - stretch(bbox_bottom,TILE_SIZE) < TILE_SIZE-1) && 
			!collide_at(x+8*image_xscale,stretch(bbox_bottom,TILE_SIZE)-8)){
				sprite_index = WaxFastRoll;
				image_index = 0;
				setState(states.Airborne,airStates.Climbup);
				vsp = -max(
					uniformly_accelerated_speed_for(
						(bbox_bottom-stretch(bbox_bottom,TILE_SIZE))+2.5,
						FALLING_SPEED
					),0.75
				);
				hsp = -image_xscale*maxSpeed;
				animation = 0;
				x=round(x);
				exit;
			}
		}
		switch(subState){
			default:
			if(!hasLatched && !animation && movement_horizontal == image_xscale && alarm[3]<=0){
				setState(states.WallLatch,latchStates.WallGrab);
				sprite_index = WaxLatched;
				image_xscale = sign(hsp);
				vsp = 0;
				hsp = 0;
				hasLatched = 1;
				alarm[2] = -1;
				alarm_set(3,34);
				x=round(x);
				exit;
			}else hsp = 0;
			break;
			case airStates.Dive:
				wax_collide_dive(movement_horizontal);
			break;
			case airStates.WaveJump:
				wax_collide_dive(movement_horizontal);
			break;
			case airStates.Climbup:
				hsp = 0;
			break;
		}
	break;
}