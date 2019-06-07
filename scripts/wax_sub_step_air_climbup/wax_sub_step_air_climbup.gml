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
	hsp = lerp(hsp,image_xscale*maxSpeed,0.155);
#endregion
#region vertical movent
if (vsp <= MAXFALLINGSPEED*weight){
	if(vsp >= 0){
		vsp += (global.grav*weight/(floatyness/1.5));
	}else if(vsp < 0){
		vsp += (global.grav*weight/floatyness);
	}
}
#endregion
#region doublejump
if((request_jump || (movement_jump_hold && autoWallRun)) && tilemap_get_at_pixel(WMAP,x,y)){
	wax_wallRun(movement_horizontal);
}
#endregion
#region attacks
	if (request_attack) wax_attack_start((movement_crouch_hold) ? attackState.DownAir: attackState.AirSlash);
#endregion

return  SUCCESS_CODE;