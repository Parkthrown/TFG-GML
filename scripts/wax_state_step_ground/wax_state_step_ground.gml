#region inputs
if(global.IO[0] == id){
	var movement_horizontal = global.input_movementHorizontal;
	var movement_vertical = global.input_movementVertical;
	var request_interact = global.input_interact;
	var movement_crouch_hold = global.input_crouchHold;
	var request_jump = global.input_jump;
	var movement_jump_hold =  global.input_jumpHold;
	var request_attack =  global.input_shoot;
	var request_roll =  global.input_roll;
	var request_grab = global.input_grab;
}else {
	var movement_horizontal = 0;
	var movement_vertical = 0;
	var request_interact = 0;
	var movement_crouch_hold = 0;
	var request_jump = 0;
	var movement_jump_hold =  0;
	var request_attack =  0;
	var request_roll =  0;
	var request_grab = 0;
}
#endregion
#region subStates
var doState;
var stateData = argument0;
var stateArgs = argument0[?fsmData.stateArgs];
var stateScript = argument0[?fsmData.stateScript];
var subFsm = argument0[?fsmData.subFSM];
doState = fsm_group_execute_state(subFsm,subState);
#endregion 
if(doState){
	#region interacting
	#region door
	var _door = instance_place(x,y,obj_door);
	if(instance_exists(_door)){
		if(!instance_exists(obj_interactArrow)){
			if(state != states.Cutscene){
				create_interact_arrow(_door);
			}
		}
		if(request_interact > 0 && alarm[4] <= 0){
			alarm_set(4,15);
			instance_destroy(obj_transition);
			with(instance_create_depth(x,y,0,obj_transition)){
				var tCamX = obj_Cam.x-obj_Cam.width/2;
				var tCamY = obj_Cam.y-obj_Cam.height/2;
				var _x = ((other.x - tCamX)/(obj_Cam.width/100))/100;
				var _y = ((other.y - tCamY)/(obj_Cam.height/100))/100;
				xx = _x;
				yy = _y;
				door = _door;
			}
			state = states.Cutscene;
			persistent = 1;
		}
	}
	#endregion
	#region arcade
	var arcade = instance_place(x,y,obj_arcade)
	if(arcade){
		if(!instance_place(x,y-16,obj_interactArrow)){
			create_interact_arrow(arcade);
		}
		if(request_interact > 0 && alarm[4] <= 0){
			instance_destroy(obj_transition);
			alarm_set(4,15);
			state = states.Cutscene;
			persistent = 0;
			sprite_index = waxArcade;
			with(arcade){
				alarm_set(0,60);
				alarm_set(1,20);
			}
		}
	}
	#endregion
	#region npc
	var _npc = instance_place(x,y,obj_npc);
		if(instance_exists(_npc)){
			if(!instance_exists(obj_interactArrow)){
				if(state != states.Cutscene){
					create_interact_arrow(_npc);
				}
			}
			if(request_interact){
				var totalk = instance_place(x,y,obj_npc);
				with(totalk){
					if(!talking){
						talking = other;
						if(variable_instance_exists(id,"dialog")){
							instance_destroy(obj_interactArrow);
							dialog_start(other)
							other.state = states.Cutscene;
							other.hsp = 0;
							other.vsp = 0;
						}else{
							talk(text,color,other);
						}
					}
				}
			}
		}
	#endregion
	#region ladder
	var _ladder = instance_place(x,y,obj_ladder)
	if(_ladder){
		if(request_interact > 0){
			state = states.Ladder;
			sprite_index = WaxStill;
			hsp = 0;
			vsp = 0;
			fsm_execute_state(fsm_map,ev_step,states.Ladder);
		}
	}
	#endregion
	#endregion
	#region Idle sleeping etc
	if(hsp == 0 && vsp == 0){
		if( alarm[6] <= 0){
			alarm_set(6,380);
		}
	}else{
		alarm[6]= -1;
	}
	#endregion
	#region State changes
	if(!isGrounded()){
		if(!alarm[waxAlarms.coyotte]) alarm_set(waxAlarms.coyotte,5);
	}else if(movement_horizontal == 0 
	&& subState != groundStates.Fallen){
		if (!isGroundedAt(x+hsp,y)) hsp = 0;
	}
	#endregion
	#region collision
		collideH();
		x+=hsp;
		collision_tile_snap();
	#endregion
}