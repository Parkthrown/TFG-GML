/// @description coyotte
switch(state){
	default:
	break;
	case states.OnGround:
		setState(states.Airborne,airStates.Regular);
		if(!animation) sprite_index = WaxFall;
		autoWallRun = 1;
	break;
	case states.Airborne:
	switch(subState){
			case airStates.WallSquat:
				wax_wallRunHorizontal();
			break;
		}
	break;
	case states.WallLatch:
		switch(subState){
			case latchStates.WallGrab:
				setState(states.Airborne,airStates.Regular);
				sprite_index = (holding) ? WaxFallHolding : WaxFall;
				image_index = 0;
				hsp = -image_xscale*1.10;
				vsp = -1.75;
				jumpCount++;
				hasLatched = 1;
				shaker(2,8,obj_Cam);
			break;
			case latchStates.WallKick:
				setState(states.Airborne,airStates.Knocked);
				sprite_index = WaxHurt;
				image_index = 0;
				hsp = -image_xscale*1.25;
				vsp = -1.75;
				jumpCount++;
				hasLatched = 1;
				shaker(4,7,obj_Cam);
				audio_play_sound(snd_land_low,1,0);
			break;
		}
	break;
}