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
#region horizontal movement
	hsp = lerp(hsp,0,0.1);
#endregion
#region sprites and subStates
if(!animation){
	if (!movement_crouch_hold){
		sprite_index = WaxIdle;
		setState(state,groundStates.Regular);
		return SUCCESS_CODE;
	}
}
#endregion
#region request_jump
	if(request_jump != 0){
		var _drop = instance_place(x,y+1,obj_semiSolid);
		if(instance_exists(_drop)){
			if(bbox_bottom < _drop.bbox_top){
				if(!collide_at(x,y+1)){
					var _ladder = instance_place(x,y+TILE_SIZE,obj_ladder)
					if(_ladder){
						sprite_index = WaxStill;
						y+=1;
						
						setState(states.Ladder,states.Default);
						
						hsp = 0;
						vsp = 0;
						return FAILURE_CODE;
					}
					sprite_index = WaxFall;
					y+=1;
					
					setState(states.Airborne,airStates.Regular);
					
					return FAILURE_CODE;
				}
			}
		}
		wax_jump_squat();
		return SUCCESS_CODE;
	}
#endregion
#region waves
if(request_roll && movement_horizontal != 0 && alarm[1] < 0){
		wax_wave_squat();
}
#endregion
return SUCCESS_CODE;