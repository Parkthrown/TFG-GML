gml_pragma("global","macros();");
#region triggers
#macro TRIGGER_EVENT 3
#endregion
#region things that game maker should have but doesn't

#macro INTEGER_MAX_VALUE power(2,31)
#macro INTEGER_MIN_VALUE -INTEGER_MAX_VALUE

#endregion
#region colors

#macro PALETTE sprite_get_texture(spr_pal,0)
#macro C_NES_GRAY make_color_rgb(82,82,82)
#macro C_NES_GRAY_1 make_color_rgb(121,121,121)
#macro C_NES_GRAY_2 make_color_rgb(178,178,178)
#macro C_NES_GRAY_3 make_color_rgb(235,235,235)
#macro C_NES_RED make_color_rgb(178,16,48)
#macro C_NES_ORANGE make_color_rgb(227,81,0)
#macro C_NES_YELLOW make_color_rgb(255,162,0)
#macro C_NES_BLUE make_color_rgb(32,0,178)
#macro C_NES_BLUE2 make_color_rgb(32,0,178)
#macro C_NES_BLUE3 make_color_rgb(32,0,178)
#macro DAMAGECYCLE rgbToGlsl([178.,16.,48.,97.,211.,227.,227,81,0,1.,1.,1.])


#endregion
#region constants
#region trace
	#macro TRACE_WARNING "[-WARNING-]: "
	#macro TRACE_ERROR "[-ERROR-]: "
	#macro TRACE_SEPARATOR ">>>>>>>>>>>>>>>>>>>>>>>>\n"
#endregion
#region expressions
	#macro CENTERX (bbox_right+bbox_left)/2. 
	#macro CENTERY (bbox_top+bbox_bottom)/2.
	#macro CURRENT_BRIGHTNESS global.brightness
	#macro BBOX_RIGHT_DISTANCE abs(bbox_right - x)
	#macro BBOX_LEFT_DISTANCE -abs(x - bbox_left)
	#macro BBOX_TOP_DISTANCE -abs(y - bbox_top)
	#macro BBOX_BOTTOM_DISTANCE abs(bbox_bottom - y)
	#macro TARGETEABLE global.interfaces[|interfaces.targeteable]
	#macro TARGETEABLE_PLAYER global.interfaces[|interfaces.targeteable_player]
#endregion
#region general use
	#macro TIMER (current_time/1000)
	#macro SECONDS_IN_DAY 86400
	#macro FRAME (1/60)
	#macro FAILURE_CODE -1
	#macro SUCCESS_CODE 1
	#macro TAU 6.283185307
#endregion
#region world
	#macro LAYER_WALL_NAME "wMap"
	#macro LAYER_COLLISION_NAME "cMap"
	#macro LAYER_PLATFORM_NAME "pMap"
	#macro LAYER_DAMAGE_NAME "hMap"
	#macro LAYER_BOUNDS_NAME "bMap"
	#macro CMAP layer_tilemap_get_id(layer_get_id(LAYER_COLLISION_NAME))
	#macro PMAP layer_tilemap_get_id(layer_get_id(LAYER_PLATFORM_NAME))
	#macro HMAP layer_tilemap_get_id(layer_get_id(LAYER_DAMAGE_NAME))
	#macro MBOUNDS layer_tilemap_get_id(layer_get_id(LAYER_BOUNDS_NAME))
	#macro WMAP layer_tilemap_get_id(layer_get_id(LAYER_WALL_NAME))
	#macro LAYERS_MANDATORY [LAYER_BOUNDS_NAME,LAYER_COLLISION_NAME,LAYER_DAMAGE_NAME,LAYER_PLATFORM_NAME,LAYER_WALL_NAME]
	#macro NAVIGATOR_LAYER_ELEMENTS [layerelementtype_tilemap,layerelementtype_background,layerelementtype_particlesystem]
#endregion
#region characters
	#macro MAXHP 5
	#macro MAXFALLINGSPEED 8
	#macro TESTICLE 23
	#macro DEATH_ROUTINE global.deathMap[?object_index]
	#macro WALLRUN_SPEED_MODIFIER 1.45
	#macro WALLRUN_JUMP_MODIFIER 2.0
	#macro JUMP_MAX_STRENGTH -3.5
	#macro FALLING_SPEED (global.grav*weight/floatyness)
	#macro FALLING_SPEED_UPWARDS (global.grav*weight/(floatyness*1.5))
#endregion
#region files
	#macro SAVE_FORMAT ".json"
	#macro CONFIG_DIRECTORY "config"
	#macro CONTROLLER_FILE (CONFIG_DIRECTORY +"/cData" + SAVE_FORMAT)
	#macro KEYBOARD_FILE (CONFIG_DIRECTORY +"/kData" + SAVE_FORMAT)
	#macro INCLUDED_DIRECTORY "included"
	#macro CAPE_FILE (INCLUDED_DIRECTORY + "/cape.png")
	#macro SAVE_DIRECTORY "data"
	#macro SAVE_PREFIX "sf"	
#endregion
#region drawing
	#macro SAVE_FILE_HEIGHT 44
	#macro SAVE_FILE_WIDTH 88
#endregion
#region shaders

#macro U_VCOLORS "u_vColors"
#macro U_VREPLACECOLORS "u_vReplaceColors"
#macro REPLACE_GREYS [0.92156863,0.69803922,0.4745098]
#macro KEY_COLORS [C_NES_YELLOW,C_NES_BLUE,$9aeb00,C_NES_RED]
#endregion
#region UI
	#macro GAME_WIDTH 480
	#macro GAME_HEIGHT 270
	#macro TIMER_BASE 100
	#macro MENU_BASE_COOLDOWN 15
	#macro EMPTY_FILE "NO DATA"
#endregion
#region game menu
	#macro MENU_SCENE_Y 1628
	#macro MENU_INITIAL "PRESS START"
	#macro MENU_PRESS_ANY_KEY "PRESS ANY KEY"
	#macro MENU_SINGLE_PLAYER "SINGLEPLAYER"
	#macro MENU_START_GAME "START GAME"
	#macro MENU_MAIN "MAIN"
	#macro MENU_SFX "SFX"
	#macro MENU_MUSIC "MUSIC"
	#macro MENU_SETTINGS "SETTINGS"
	#macro MENU_CONTROLS "CONTROLS"
	#macro MENU_SOUND "SOUND"
	#macro MENU_SCREENSHAKE "SCREENSHAKE"
	#macro MENU_KEYBOARD "KEYBOARD"
	#macro MENU_CONTROLLER "CONTROLLER"
	#macro MENU_MODE CONTROLS_MODE
	#macro MENU_CONTROLLER_BINDINGS "BINDINGS"
	#macro MENU_EXIT "EXIT"
	#macro MENU_YES "YES"
	#macro MENU_NO "NO"
	#macro MENU_FILE_OPTIONS "FILE OPTIONS"
#endregion
#region controls

	#macro CONTROLS_JUMP_NAME "JUMP"
	#macro CONTROLS_RIGHT_NAME "RIGHT"
	#macro CONTROLS_LEFT_NAME "LEFT"
	#macro CONTROLS_INTERACT_NAME "INTERACT"
	#macro CONTROLS_CROUCH_NAME "CROUCH"
	#macro CONTROLS_ATTACK_NAME "ATTACK"
	#macro CONTROLS_ROLL_NAME "ROLL"
	#macro CONTROLS_GRAB_NAME "GRAB"
	#macro CONTROLS_PAUSE_NAME "PAUSE"
	#macro CONTROLS_MODE_NAME "MODE"
	
	#macro CONTROLS_JUMP 0x100
	#macro CONTROLS_RIGHT 0x101
	#macro CONTROLS_LEFT 0x102
	#macro CONTROLS_INTERACT 0x103
	#macro CONTROLS_CROUCH 0x104
	#macro CONTROLS_ATTACK 0x105
	#macro CONTROLS_ROLL 0x106
	#macro CONTROLS_GRAB 0x107
	#macro CONTROLS_PAUSE 0x108
	#macro CONTROLS_MODE 0x109

#endregion
#endregion