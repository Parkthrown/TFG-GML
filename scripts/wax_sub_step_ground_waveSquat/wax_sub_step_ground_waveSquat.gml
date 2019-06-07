#region inputs
if(global.IO[0] == id){
	var movement_horizontal = global.input_movementHorizontal;
	var movement_vertical = global.input_movementVertical;
	var request_interact = global.input_interact;
	var movement_crouch_hold = global.input_crouchHold;
	var request_jump = global.input_jump;
	var movement_jump_hold =  global.input_jumpHold;
	var movement_roll_hold =  global.input_rollHold;
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
	var movement_roll_hold = 0;
	var request_attack =  0;
	var request_roll =  0;
	var request_grab = 0;
}
#endregion
if(request_jump){
	wax_waveDash(movement_horizontal);
	wax_waveJump();
}
if(!movement_roll_hold){
	wax_waveDash(movement_horizontal);
	alarm_set(waxAlarms.dives,30);
	return SUCCESS_CODE;
}

return SUCCESS_CODE;