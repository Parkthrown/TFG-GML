for(var i = gp_face1; i<gp_axisrv; i++){
	if(gamepad_button_check(argument0,i)) return i;
	if(abs(gamepad_axis_value(argument0,i))) return i;
}
return false;