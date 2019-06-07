
var cmap = CMAP;
var csolid = (instance_position(bbox_left+2,y,obj_solid) ||
instance_position(bbox_right-2,y,obj_solid) ||
instance_position(x,bbox_top+2,obj_solid) ||
instance_position(x,bbox_bottom-2,obj_solid))

if(csolid){
	if(object_get_parent(object_index) != obj_player){
		instance_destroy();
	}else{
		HP = 0;
	}

}