
setState(states.Airborne,airStates.WallRun);

image_index = (sprite_index == WaxWallRunUpwards) ? image_index: 4;
sprite_index = WaxWallRunUpwards;
animation = 1;

autoWallRun = 1;
hasLatched = 0;
diveCount = 0;

hsp/=WALLRUN_SPEED_MODIFIER;
vsp = -1.55 * WALLRUN_JUMP_MODIFIER;
	
wax_part_jump();

alarm_set(waxAlarms.particles,1);