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
#region variables
	var frame = floor(image_number);
#endregion
#region horizontal movement
	hsp = (movement_horizontal != 0) ? lerp(hsp,0,0.1*abs(hsp)) : lerp(hsp,0,0.15);
#endregion
#region sprite direction
	image_xscale = (sign(movement_horizontal) != 0 && frame < 3) ? sign(movement_horizontal): image_xscale;
#endregion

if(abs(hsp) < 0.5 && movement_horizontal == 0 && alarm[2] <= 0){
	hsp = 0;
	x = round(x);
}

if(frame_end(2)) {
	if((holding && wax_throw()) || projectile_shoot(projectile)){
		hsp = image_xscale*1.25;
		wax_part_groundDash(image_xscale);
	}else{
		
	}
}

return SUCCESS_CODE;