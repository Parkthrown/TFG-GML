var sw = sprite_width/2;
var sh = sprite_height/2;
repeat(argument0){
part_particles_create_color(global.part_system_front,x+random_range(-sw,sw),y+random_range(-sh,sh),obj_partManager.partHeal,
c_white,1);
}