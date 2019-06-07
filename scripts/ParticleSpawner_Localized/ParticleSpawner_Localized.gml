///@argument0 x
///@argument1 y
///@argument2 image
///@argument3 hsp
///@argument4 acceletration
///@argument5 inverted
///@argument6 gravity
var PartImage = part_type_create();
part_type_sprite(PartImage,argument2,1,1,0);
part_type_size(PartImage,1,1,0,0);
part_type_speed(PartImage,0,argument3,argument4,0);
if(argument5 < 0) part_type_orientation(PartImage,180,180,0,0,0);
else part_type_orientation(PartImage,0,0,0,0,0);
part_type_gravity(PartImage,argument6,90);
part_type_life(PartImage,sprite_get_speed(argument2),sprite_get_speed(argument2));

var xx = argument0;
var yy = argument1;
//Fireball particle emitter
var fireEmitter = part_emitter_create(global.part_system_front);
part_emitter_region(global.part_system_front,fireEmitter,xx,xx,yy,yy,ps_shape_ellipse,ps_distr_gaussian);
part_emitter_burst(global.part_system_front,fireEmitter,PartImage,1);
part_emitter_destroy(global.part_system_front,fireEmitter);