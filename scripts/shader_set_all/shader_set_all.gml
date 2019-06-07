///@argument shade
///@argument variables

for(var i = 1; i< array_length_1d(argument[1]); i++){
	var uniform = argument[1];
	shader_set_uniform_f(uniform[0],uniform[1]);
}
