if(!global.controls_gamepad){
	global.input_movementHorizontal = sign(-keyboard_get(CONTROLS_LEFT)+keyboard_get(CONTROLS_RIGHT));
	global.input_movementVertical = keyboard_get(CONTROLS_CROUCH)-keyboard_get(CONTROLS_INTERACT);
	global.input_interact = keyboard_get_pressed(CONTROLS_INTERACT);
	global.input_crouchHold = keyboard_get(CONTROLS_CROUCH);
	global.input_jump = keyboard_get_pressed(CONTROLS_JUMP);
	global.input_jumpHold=  keyboard_get(CONTROLS_JUMP);
	global.input_shoot =  keyboard_get_pressed(CONTROLS_ATTACK);
	global.input_shootHold =  keyboard_get(CONTROLS_ATTACK);
	global.input_roll =  keyboard_get_pressed(CONTROLS_ROLL);
	global.input_rollHold =  keyboard_get(CONTROLS_ROLL);
	global.input_grab = keyboard_get_pressed(CONTROLS_GRAB);
	global.input_grabHold = keyboard_get(CONTROLS_GRAB);
	global.input_pause = keyboard_get_pressed(CONTROLS_PAUSE);
	global.controls_gamepad = gamepad_is_connected(0) && padcheck_any(0);
}else{
	controller_get_global_inputs(0);
}