///@argument0 min
///@argument1 max
///@argument2 speed

var spd = argument2;
var minn = argument0;
var maxx = argument1; 
for(var i = 0; i<random_range(minn,maxx);i++){
	with(instance_create_depth(random_range(bbox_left,bbox_right),random_range(bbox_top,bbox_bottom),depth,obj_debris)){
		set_speed_from_angle([random_range(x-1,x+1),random_range(y-1,y+1)],spd);
	}
}