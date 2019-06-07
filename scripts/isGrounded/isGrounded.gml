var cmap = CMAP;
var isBellow = 0;
if(place_meeting(x,y+1,obj_semiSolid) || place_meeting(x,y+1,obj_box)){
	var ss = collideBellow(x,y+1,obj_semiSolid);
	var ob = collideBellow(x,y+1,obj_box);
	if(instance_exists(ss)){
		isBellow = (ss.bbox_top > bbox_bottom) ? 1: isBellow;
	}
	if(instance_exists(ob)){
		isBellow = (ob.bbox_top > bbox_bottom) ? 1: isBellow;
	}
}

var tCol =  collision_tiles(cmap,bbox_left,bbox_bottom+1) ||
			collision_tiles(cmap,x,bbox_bottom+1) ||
			collision_tiles(cmap,bbox_right,bbox_bottom+1);
return (place_meeting(x,y+1,obj_solid) || tCol || isBellow);
