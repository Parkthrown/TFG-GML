if(global.transition || global.paused) exit;
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
#region spikes
#endregion
#region StateMachine
	fsm_execute_state(fsm_map,event_type,state);
#endregion
#region coins and other pickups
var _vessel = instance_place(x,y,obj_vessel);
with(_vessel){
	if(ds_list_contains(global.vessels,name)){
		global.vessels[|ds_list_size(global.vessels)] = name;
	}
	instance_destroy();
}

var _score = instance_place(x,y,obj_score);
with(_score){
	global.coins += ammount;
	instance_destroy();
}

var _checkPoint = instance_place(x,y,obj_checkPoint);
with(_checkPoint){
	if(!active){
		with(obj_checkPoint){
			if(id != _checkPoint.id) active = 0;
		}
		if(global.checkPointData) ds_map_destroy(global.checkPointData);
		global.checkPointData = checkPoint_save(other,room,[x,y]);
		active = 1;
		flameType = other.flameType;
		event_user(0);
	}
}

var _food = instance_place(x,y,obj_food);
with(_food){
	if((other.HP < MAXHP) && boil){
		other.HP = min(other.HP+returns,MAXHP);
		PartHeal(_food.returns*16);
		instance_destroy();
	}
}
#endregion
#region Instant Doors
if(place_meeting(x,y,obj_doorInst)){
	if(alarm[4] <= 0){
		alarm_set(4,15);
		instance_destroy(obj_transition);
		var _door = instance_place(x,y,obj_door);
		with(instance_create_depth(x,y,0,obj_transition)){
			var tCamX = obj_Cam.x-obj_Cam.width/2;
			var tCamY = obj_Cam.y-obj_Cam.height/2;
			xx = ((other.x - tCamX)/(obj_Cam.width/100))/100;
			yy = ((other.y - tCamY)/(obj_Cam.height/100))/100;
			door = _door;
		}
		state = states.Cutscene;
		persistent = 1;
	}
}
#endregion
#region altars
var _altar = instance_place(x,y,obj_altar);
if(instance_exists(_altar)){
	flameType = _altar.flameType;
}
#endregion
if(holding){
	with(holding){
			x = other.x;
			y = other.y - 4 - BBOX_BOTTOM_DISTANCE;
	}
}
