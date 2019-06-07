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
#region attacks
if (request_attack){
	wax_attack_start(attackState.Slash);
}
#endregion
#region throwing / shooting
if(request_grab && (holding || !wax_grab())){
	animate(WaxThrow,0,true);
	setState(states.OnGround,groundStates.Throwing);
}
#endregion
#region request_jump
if(request_jump){
	wax_jump_squat();
	return SUCCESS_CODE;
}
#endregion
#region dives
if(request_roll && diveCount < maxJumps && alarm[1] < 0){
	wax_dive(movement_horizontal,2.75,-1.5,15);
	return FAILURE_CODE;
}
#endregion
#region horizontal movement
if(movement_horizontal != 0){
	setState(state,groundStates.Walking);
	if(!animation && !holding){
		
		image_xscale = movement_horizontal;
		sprite_index = WaxGroundDash;
		image_index = 0;
		
		wax_part_groundDash(image_xscale);
		
		animation = 1;
		hsp = image_xscale * maxSpeed/2;
	}
	fsm_execute_state(fsm_map,event_type,state);
	return SUCCESS_CODE;
}else{
	hsp = lerp(hsp,0,0.15);
}
#endregion
#region sprites and subStates
if(!animation){
	if (movement_crouch_hold){
		if(holding) wax_drop();
		sprite_index = WaxCrouch;
		setState(state,groundStates.Crouch);
		alarm_set(7,1);
		return SUCCESS_CODE;
	}
	if(!holding){
		if(instance_exists(obj_enemy) && distance_to_object(instance_nearest(x,y,obj_enemy))<= TILE_SIZE*5){
			sprite_index = WaxFightingIdle;
		}else{
			sprite_index = WaxIdle;
		}
		
	}else{
		sprite_index = WaxIdleHolding;
	}
}
#endregion
#region sprite direction
	image_xscale = (sign(movement_horizontal) != 0 && !animation) ? sign(movement_horizontal): image_xscale;
#endregion
#region alignment
if(abs(hsp) < 0.5 && movement_horizontal == 0 && alarm[2] <= 0){
	hsp = 0;
	x = round(x);
}
#endregion

return SUCCESS_CODE;