///@param partType
///@param ammount
///@param colors
///@param x1
///@param y1
///@param x2
///@param y2

var vx = camera_get_view_x(view_camera[0]);
var vy = camera_get_view_y(view_camera[0]);
var fireEmitter = part_emitter_create(global.part_system_light);
part_emitter_region(global.part_system_light,fireEmitter,argument3-vx,argument5-vx,argument4-vy,argument6-vy,ps_shape_rectangle,ps_distr_gaussian);
	part_type_color2(argument0,argument2,c_black);
	part_emitter_burst(global.part_system_light,fireEmitter,argument0,argument1);
part_emitter_destroy(global.part_system_light,fireEmitter);