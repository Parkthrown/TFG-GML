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
hsp = (movement_horizontal == image_xscale) ?
lerp(hsp,(maxSpeed*image_xscale)/2,global.grav/(weight*25)):
lerp(hsp,(maxSpeed*movement_horizontal)/2.5,0.1);
if (alarm[2]) hsp = lerp(hsp,(maxSpeed * movement_horizontal)/2,0.025);
#endregion
#region force stop
if((request_jump || (movement_jump_hold && autoWallRun)) && tilemap_get_at_pixel(WMAP,x,y)){
	wax_wallRun(movement_horizontal);
	hsp/=2;
}
#endregion
#region vertical movement
	if (vsp <= 8){
		vsp += (global.grav*weight/4.5);
	}
#endregion
#region vertical bounces
	wax_bounce(-4);
#endregion
#region attacks
	if(request_attack && flameType) wax_attack_start(attackState.RollSlash);
#endregion

return  SUCCESS_CODE;