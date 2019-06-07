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
if(movement_horizontal != 0 && abs(hsp)>1.5){
	hsp = lerp(hsp,0,0.050);
}else{
	hsp = lerp(hsp,0,0.135);
}
		
#endregion
#region sprites and subStates
if(!animation){
	if(abs(hsp) <= 0.5){
		if(movement_crouch_hold){
			x=round(x);
			sprite_index = WaxCrouch;
			setState(state,groundStates.Crouch)
			hsp = 0;
			return SUCCESS_CODE;
		}else{
			sprite_index = WaxIdle;
			setState(state,groundStates.Regular)
			return SUCCESS_CODE;
		}
		alarm_set(7,1);
	}else{
		if(!movement_crouch_hold && abs(hsp) < 1){
			sprite_index = WaxIdle;
			setState(state,groundStates.Regular)
			hsp = min(2,abs(hsp))*sign(hsp);
			alarm_set(7,1);
			return SUCCESS_CODE;
		}
	}
}
#endregion
#region dives
if(request_roll && diveCount < maxJumps && alarm[1] < 0){
		wax_dive(movement_horizontal,3.5,-1.5,15);
		return FAILURE_CODE;
}
#endregion
#region request_jump
	if(request_jump != 0){
		wax_waveJump();
		return FAILURE_CODE;
	}
#endregion
#region attacks
	if (request_attack){
		wax_attack_start(attackState.DashSlash);
	}
#endregion
return SUCCESS_CODE;