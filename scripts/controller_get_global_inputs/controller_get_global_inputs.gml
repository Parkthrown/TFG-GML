///@arg controller number
#region gamepad
		if(global.contMap[?CONTROLS_MODE] == 1){
			#region d-pad
				global.input_movementHorizontal = sign(gamepad_button_check(argument0,gp_padr) - gamepad_button_check(argument0,gp_padl));
				global.input_movementVertical = sign(gamepad_button_check(argument0,gp_padd) - gamepad_button_check(argument0,gp_padu));
				global.input_interact = gamepad_button_check_pressed(argument0,gp_padu);
				global.input_crouchHold = sign(gamepad_button_check(argument0,gp_padd));
			#endregion
		}else{
			#region stick
				global.input_movementVertical = sign(gamepad_axis_value(argument0,gp_axislv));
				global.input_movementHorizontal = sign(gamepad_axis_value(argument0,gp_axislh));
				gamepad_set_axis_deadzone(argument0,0.80);
				global.input_interact = -min(gamepad_axis_value(argument0,gp_axislv),0);
				gamepad_set_axis_deadzone(argument0,0.30);
				global.input_crouchHold  = max(gamepad_axis_value(argument0,gp_axislv),0);
			#endregion
		}
		#region keybinds
			global.input_jump = controller_get_pressed(CONTROLS_JUMP,argument0);
			global.input_jumpHold =  controller_get(CONTROLS_JUMP,argument0);
			global.input_shoot =  controller_get_pressed(CONTROLS_ATTACK,argument0);
			global.input_shootHold =  controller_get(CONTROLS_ATTACK,argument0);
			global.input_roll =  controller_get_pressed(CONTROLS_ROLL,argument0);
			global.input_rollHold =  controller_get(CONTROLS_ROLL,argument0);
			global.input_grab = controller_get_pressed(CONTROLS_GRAB,argument0);
			global.input_grabHold = controller_get(CONTROLS_GRAB,argument0);
			global.input_pause = controller_get_pressed(CONTROLS_PAUSE,argument0);
		#endregion
		global.controls_gamepad = gamepad_is_connected(argument0) && !keyboard_check(vk_anykey);
	#endregion