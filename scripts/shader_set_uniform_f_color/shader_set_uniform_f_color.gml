///@argument0 uniform_Id
///@argument1 color

var col = argument1;
shader_set_uniform_f(argument0,color_get_red(col)/255., color_get_green(col)/255., color_get_blue(col)/255.);