/// declare variables
event_inherited();
#region setup
global.player = id;
global.IO[0] = id;
#endregion
#region visuals
	light_radius = 38;
#endregion
#region state variables
	state = states.OnGround;
	subState = groundStates.Regular;
#endregion
#region state machines
	#region state
		fsm_map = ds_map_create();
		#region fsm step
			fsm_add_state(fsm_map,ev_step,states.Default,wax_state_step_default);
			fsm_add_state(fsm_map,ev_step,states.OnGround,wax_state_step_ground);
			fsm_add_state(fsm_map,ev_step,states.Airborne,wax_state_step_airborne);
			fsm_add_state(fsm_map,ev_step,states.Ladder,wax_state_step_ladder);
			fsm_add_state(fsm_map,ev_step,states.Sleepy,wax_state_step_sleepy);
			fsm_add_state(fsm_map,ev_step,states.WallLatch,wax_state_step_default);
		#endregion
		#region fsm draw
			fsm_add_state(fsm_map,ev_draw,states.Default,wax_state_draw_default);
			fsm_add_state(fsm_map,ev_draw,states.OnGround,wax_state_draw_default);
			fsm_add_state(fsm_map,ev_draw,states.Airborne,wax_state_draw_default);
		#endregion
	#endregion
	#region subState step
		#region ground
			var fsm_sub_step_grounded = ds_map_create();
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.Regular,wax_sub_step_ground_regular);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.Walking,wax_sub_step_ground_walking);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.Crouch,wax_sub_step_ground_crouch);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.WaveDash,wax_sub_step_ground_waveDash);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.Fallen,wax_sub_step_ground_fallen);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.JumpSquat,wax_sub_step_ground_jumpSquat);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.WaveSquat,wax_sub_step_ground_waveSquat);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.Throwing,wax_sub_step_ground_throwing);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.Slash,wax_sub_step_attack,attackState.Slash);
			fsm_group_add_state(fsm_sub_step_grounded,groundStates.DashSlash,wax_sub_step_attack,attackState.DashSlash);
			fsm_add_sub_state(fsm_map,ev_step,states.OnGround,fsm_sub_step_grounded);
		#endregion
		#region air
			var fsm_sub_step_airborne = ds_map_create();
			fsm_group_add_state(fsm_sub_step_airborne,airStates.Regular,wax_sub_step_air_regular);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.Dive,wax_sub_step_air_dive);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.WaveJump,wax_sub_step_air_waveJump);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.Knocked,wax_sub_step_air_knocked);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.WallRun,wax_sub_step_air_wallRun);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.WallSquat,wax_sub_step_air_wallSquat);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.Climbup,wax_sub_step_air_climbup);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.Throwing,wax_sub_step_air_throwing);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.DownAir,wax_sub_step_attack,attackState.DownAir);
			fsm_group_add_state(fsm_sub_step_airborne,airStates.Slash,wax_sub_step_attack,attackState.AirSlash);
			fsm_add_sub_state(fsm_map,ev_step,states.Airborne,fsm_sub_step_airborne);
		#endregion
		#region WallLatch
			var fsm_sub_step_wallLatch = ds_map_create();
			fsm_group_add_state(fsm_sub_step_wallLatch,latchStates.WallGrab,wax_sub_step_wall_grab);
			fsm_group_add_state(fsm_sub_step_wallLatch,latchStates.WallKick,wax_sub_step_wall_kick);
			fsm_add_sub_state(fsm_map,ev_step,states.WallLatch,fsm_sub_step_wallLatch);
		#endregion
	#endregion
	#region subState draw
		#region grounded
			var fsm_sub_draw_grounded = ds_map_create();
			fsm_group_add_state(fsm_sub_draw_grounded,states.Default,wax_draw_default);
			fsm_group_add_state(fsm_sub_draw_grounded,groundStates.WaveDash,wax_sub_draw_wave,1);
			fsm_group_add_state(fsm_sub_draw_grounded,groundStates.JumpSquat,wax_sub_draw_jumpSquat);
			fsm_group_add_state(fsm_sub_draw_grounded,groundStates.WaveSquat,wax_sub_draw_jumpSquat);
			fsm_group_add_state(fsm_sub_draw_grounded,groundStates.Slash,wax_sub_draw_attack,attackState.Slash);
			fsm_group_add_state(fsm_sub_draw_grounded,groundStates.DashSlash,wax_sub_draw_attack,attackState.DashSlash);
			fsm_add_sub_state(fsm_map,ev_draw,states.OnGround,fsm_sub_draw_grounded);
		#endregion
		#region airborne
			var fsm_sub_draw_airborne = ds_map_create();
			fsm_group_add_state(fsm_sub_draw_airborne,states.Default,wax_draw_default);
			fsm_group_add_state(fsm_sub_draw_airborne,airStates.WaveJump,wax_sub_draw_wave,2);
			fsm_group_add_state(fsm_sub_draw_grounded,airStates.WallRun,wax_sub_draw_jumpSquat);
			fsm_group_add_state(fsm_sub_draw_airborne,airStates.DownAir,wax_sub_draw_attack,attackState.DownAir);
			fsm_group_add_state(fsm_sub_draw_airborne,airStates.Slash,wax_sub_draw_attack,attackState.AirSlash);
			fsm_add_sub_state(fsm_map,ev_draw,states.Airborne,fsm_sub_draw_airborne);
		#endregion
	#endregion
#endregion
#region weapon
	weapon = lw_sword();
	projectile = lw_sword_projectile();
#endregion
#region object data
	flameType = 0;
	animation = 0;
	HP = MAXHP;
	holding = noone;
	damage = 1;
	knockback = 1;
	shots = 5;
	cdMult = 50;
	trail = ds_list_create();
	capeSurf = surface_create(128,128);
#endregion
#region physics
	weight = 1.;
	floatyness = 7;
	hsp = 0;
	vsp = 0;
#endregion
#region counters
	maxJumps = 1;
	maxSpeed = 1.8;
	maxTrail = 4;
	jumpCount = 0;
	diveCount = 0;
	hasLatched = 0;
	autoWallRun = 0;
#endregion

alarm_set(waxAlarms.particles,5);