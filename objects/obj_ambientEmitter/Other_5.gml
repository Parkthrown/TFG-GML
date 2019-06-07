/// @description Insert description here
// You can write your code in this editor
if(part_emitter_exists(system,emitter)) part_emitter_destroy(system,emitter);
if(part_type_exists(part))part_type_destroy(part);
if(part_system_exists(system) && system != global.part_system_front) part_system_destroy(system);
