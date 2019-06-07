for(var i = gp_face1; i<gp_axisrv; i++){
	if(gamepad_button_check_pressed(argument0,i)) return i;
}
return false;