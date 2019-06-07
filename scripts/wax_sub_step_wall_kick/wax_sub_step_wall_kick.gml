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
if((request_jump || request_roll) && movement_horizontal == -image_xscale){
	setState(states.Airborne, airStates.WaveJump);
	sprite_index = WaxFastRoll;
	image_index = 0;
	image_xscale = -image_xscale;
	animation = 1;
	alarm[3] = -1;
	hsp = 5*movement_horizontal;
	vsp = -2.25;
	jumpCount = 0;
	diveCount++;
	alarm_set(5,1);
}

return SUCCESS_CODE;