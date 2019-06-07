#region inputs
if(global.IO[0] == id){
	var movement_horizontal = global.input_movementHorizontal;
	var movement_vertical = global.input_movementVertical;
	var request_interact = global.input_interact;
	var movement_crouch_hold = global.input_crouchHold;
	var request_jump = global.input_jump;
	var movement_jump_hold =  global.input_jumpHold;
	var request_attack =  global.input_shoot;
	var request_roll =  global.input_roll;
	var request_grab = global.input_grab;
}else {
	var movement_horizontal = 0;
	var movement_vertical = 0;
	var request_interact = 0;
	var movement_crouch_hold = 0;
	var request_jump = 0;
	var movement_jump_hold =  0;
	var request_attack =  0;
	var request_roll =  0;
	var request_grab = 0;
}
#endregion
var frame = floor(image_index);
var success = true;
#region wallkick / horizontal movement
switch(sprite_index) {
	case WaxWallRun:
		if(frame == 4 || frame == 9){
			if(tilemap_get_at_pixel(WMAP,x,y)){
				hsp = lerp(hsp,0,0.1);
				if(frame_end(frame)){
					if(movement_jump_hold){
						wax_wallRun(movement_horizontal);
					}else success = false;
				}
			}else{
				success = false;
			}
		}else{
			hsp = lerp(hsp,0,0.02);
		}
	break;
	case WaxWallRunUpwards:
			if(frame <= 3 && frame > 0){
			if(tilemap_get_at_pixel(WMAP,x,y)){
				vsp = lerp(vsp,0,0.1);
				if(frame == 3 && frame_end(frame)){
					if(movement_jump_hold){
						wax_wallRun(movement_horizontal);
					}else success = false;
				}
			}else{
				success = false;
			}
		}
		hsp = lerp(hsp,0,0.08);
	break;
}
#endregion
if(!success){
	sprite_index = WaxFall;
	image_index = 0;
	animation = 0;
	setState(states.Airborne,airStates.Regular);
	fsm_execute_state(fsm_map,event_type,state);
	return FAILURE_CODE;
}
#region vertical movent
	if (vsp <= MAXFALLINGSPEED*weight){
			vsp = approach(vsp,MAXFALLINGSPEED*weight,global.grav*weight/(floatyness*1.20));
	}

#endregion
#region sprite direction
	image_xscale = (sign(movement_horizontal)==sign(hsp) && abs(movement_horizontal)) ? sign(movement_horizontal): image_xscale;
#endregion
return  SUCCESS_CODE;