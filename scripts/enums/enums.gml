gml_pragma("global","enums();");
#region character specifics
	enum waxAlarms {
		shooting,
		dives,
		iframes,
		coyotte,
		doors,
		trail,
		sleepy,
		particles,
		respawn,
		OOB = 11,
	}
	
	enum ambientManagerAlarms {
		refreshData,
	}
#endregion
#region interfaces
	enum interfaces {
		targeteable,
		targeteable_player,
		pauseUIComponent,
	}
#endregion
#region general use
enum fsmData{
	stateScript,
	stateArgs,
	subFSM,
}

enum events{
	collisionH, //0
	collisionBottom, //1
	collisionTop, //2
	hit,
	specialDraw,
	light,
	getInputs,
}

enum DATATYPE {
    REAL,
    STRING
}
#endregion
#region basic states

enum states{
	Default = -1,
	OnGround,
	Ladder,
	Airborne,
	WallLatch,
	Diving,
	Dthrust,
	Knocked,
	Sleepy,
	Cutscene,
	Dead,
}
#region subStates
	enum airStates{
		Regular,
		WaveJump,
		WallRun,
		WallSquat,
		WallRunUp,
		Dive,
		Knocked,
		Tumble,
		Slash,
		DownAir,
		Climbup,
		Throwing,
		Grabbing,
		Shooting,
	}

	enum groundStates{
		Regular,
		Walking,
		WaveDash,
		JumpSquat,
		WaveSquat,
		Crouch,
		Fallen,
		Slash,
		DashSlash,
		Throwing,
		Grabbing,
		Shooting,
	}

	enum slashState{
		None,
		RegSlash,
		UltraSlash,
		WeakSlash,
	}
	
	enum latchStates{
		WallGrab,
		WallKick,
		
	}
#endregion
#endregion
#region cutscenes
enum cutscenes{
	Script,
	CreateObject,
	Camera,
	ObjectActions,
	Timer,
}

enum objectActions{
	SpriteSwap,
	Overseer,
	SetVariables,
	Script,
}
#endregion
#region weapons

enum attackState{
	None = -1,
	Slash,
	AirSlash,
	RollSlash,
	DownAir,
	DashSlash,
	Parry,
}
	
enum weapons{
	Sword,
	Dagger,
	Axe,
	Whip,
	Boomerang,
}

enum weaponData{
	type,
	damage,
	knockback,
	inits,
	attacks,
	animations,
	effects,
	parry,
	projectile,
}

enum projectileData {
	type,
	actor,
	cost,
}

#endregion
#region ui
	#region GUI data
		enum uiData{
			Pickups,
			HP,
			Shots,
			Weapon,
			Keys,
			flameType,
		}
	#endregion
	#region UIComponent
	
		enum uiEvents{
			action,
			draw_basic,
			draw_selected,
		}
		
		enum uiAlarms{
			cooldown,
			effects,
			animations,
		}
		
	#endregion
#endregion
#region ambience
enum ambientState{
	cycle,
	prebaked,
	fading,
	death,
}
enum ambientTypes{
	top,
	bottom,
	left,
	right,
	screen,
}
#endregion
#region menus
	enum menuEvents{
		load,
		switchAction,
		menuBackAction,
	}
#endregion
#region controls
enum controls{
	 jump = 0x100,
	 right = 0x101,
	 left = 0x102,
	 interact = 0x103,
	 crouch = 0x104,
	 attack = 0x105,
	 roll = 0x106,
	 grab = 0x107,
	 pause = 0x108,
	 mode = 0x109,
}
#endregion
#region world objects
	enum pathTypes {
		cycle,
		pingPong,
		random,
	}
#endregion
#region navigation
	enum navigation{
		nextRoom,
		prevRoom,
		navScript,
		payload,
		layers,
	}
#endregion
#region layers 
	enum layers {
		bounds,
		collision,
		damage,
		platform,
		wall
	}
#endregion