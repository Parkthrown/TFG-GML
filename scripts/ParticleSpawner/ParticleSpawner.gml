///ParticleSpawner(ammount,image,hsp,vsp,speed gain(horizontal),directional)
///@argument0 number
///@argument1 image
///@argument2 hsp
///@argument3 vsp
///@argument4 speedgain
///@argument5 direction
//Fireball particle
var PartImage = part_type_create();
part_type_sprite(PartImage,argument1,1,1,0);
part_type_blend(PartImage,0);
part_type_size(PartImage,1,1,0,0);
part_type_speed(PartImage,0,argument2,argument4,0);
if(argument5 < 0) part_type_orientation(PartImage,180,180,0,0,0);
else part_type_orientation(PartImage,0,0,0,0,0);
part_type_gravity(PartImage,argument3,90);
part_type_life(PartImage,sprite_get_speed(argument1),sprite_get_speed(argument1));
ds_list_add(global.partList,PartImage);
//Fireball particle emitter
var imageEmitter = part_emitter_create(global.part_system_front);
part_emitter_region(global.part_system_front,imageEmitter,x,x,y,y,ps_shape_ellipse,ps_distr_gaussian);
part_emitter_burst(global.part_system_front,imageEmitter,PartImage,argument0);
part_emitter_destroy(global.part_system_front,imageEmitter);
