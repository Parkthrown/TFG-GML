
setState(states.Airborne,airStates.WallRun);

image_index = (sprite_index == WaxWallRun) ? image_index: 0;
sprite_index = WaxWallRun;

autoWallRun = 1;
hasLatched = 0;
diveCount = 0;

hsp = max(maxSpeed * WALLRUN_SPEED_MODIFIER, abs(hsp)) * image_xscale;
vsp = -1.546;
	
wax_part_groundDash(image_xscale);
	
alarm_set(waxAlarms.particles,1);