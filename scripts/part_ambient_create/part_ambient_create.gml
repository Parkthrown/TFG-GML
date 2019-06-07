///@argument0 system
///@argument1 emitter
///@argument2 partType
///@argument3 ambientType
///@argument4 tickRate
///@argument5 burst(?)


var ambient = instance_create_depth(x,y,0,obj_ambientEmitter);
with(ambient){
	system = argument0;
	emitter = argument1;
	type = argument3;
	part = argument2;
	num = argument4;
	burst = argument5
	part_emitter_region(
	system,emitter,0,room_width,
	0,room_height,ps_shape_rectangle,
	ps_distr_linear
	);
	if(!burst){
		part_emitter_stream(system,emitter,type,num);
	}else{
		alarm_set(0,burst);
	}
}

return ambient;