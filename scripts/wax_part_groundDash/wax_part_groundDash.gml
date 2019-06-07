///@arg direction
var partX = ((argument0 > 0) ? BBOX_LEFT_DISTANCE: BBOX_RIGHT_DISTANCE)/2;
part_type_scale(obj_partManager.partWaxGroundDash,image_xscale,1);
part_particles_create(global.part_system_front,x + partX ,bbox_bottom,obj_partManager.partWaxGroundDash,1);