///@desc regular sword slash attack
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
if(movement_horizontal != 0){
	hsp = lerp(hsp,((maxSpeed * movement_horizontal)/(alarm[2] ? 2: 1 )), 0.05);
}else{
	hsp = lerp(hsp,0,0.15);
}
#endregion
#region dives
if(request_roll && diveCount < maxJumps && alarm[1] < 0){
	wax_dive(movement_horizontal,2.75,-1.5,15);
	return FAILURE_CODE;
}
#endregion
sword_attack_slash();

return SUCCESS_CODE;