///@argument0 ammount
///@argument1 duration
///@argument2 target
with(instance_create_depth(x,y,depth,obj_shake)){
	_shake = argument[0];
	time = argument[1];
	alarm_set(0,argument[1]);
	target = argument[2];
	if(argument_count > 3){
		type = argument[3];
	}else{
		type = 0x1 | 0x2;
	}
}