///@argument0 uniform_Id
///@argument1 array

var len = array_length_1d(argument1);
shader_set_uniform_f(argument0,argument1[0%len],argument1[1%len]);