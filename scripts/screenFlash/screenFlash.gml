///@desc create a generic screenShader object that uses the black and white shader
///@arg time
///@arg ?uniforms
with(instance_create_depth(0,0,0,obj_screenShader)){
	shader = sh_bw;
	time = argument[0];
	uniforms = (argument_count > 1) ? argument[1] : []; 
	alarm_set(0,time);
}