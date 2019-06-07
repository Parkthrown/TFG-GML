var ev = (vsp>=0) ? events.collisionBottom: events.collisionTop;
var cmap = CMAP;

if(vsp>=0){
	if collide_at(x,y+vsp){
		var count = 0;
		repeat(abs(vsp)){
			if (collide_at(x,y+sign(vsp))) break;
			y+=sign(vsp);
		}
		event_user(ev);
		return;
	}
}else{
	var colpoint = bbox_top+vsp;
	if(collision_points_tilemap(cmap,[bbox_left,colpoint],[x,colpoint],[bbox_right,colpoint])){
		repeat(abs(vsp)){
			if (place_meeting_tiles(x,y+sign(vsp),cmap)) break;
			y+=sign(vsp);
		}
		event_user(ev);
		return;
	}
	if place_meeting(x,y+vsp,obj_solid){
		repeat(abs(vsp)){
			if (place_meeting(x,y+sign(vsp),obj_solid)) break;
			y+=sign(vsp);
		}
		event_user(ev);
		return;
	}
}

if(place_meeting(x,y+vsp,obj_semiSolid) || place_meeting(x,y+vsp,obj_box)){
	var isBellow = 0;
	var ss = collideBellow(x,y+vsp,obj_semiSolid);
	var ob = collideBellow(x,y+vsp,obj_box);
	if(instance_exists(ss)){
		if(ss.bbox_top > bbox_bottom) isBellow = 1;
	}
	if(instance_exists(ob)){
		if(ob.bbox_top > bbox_bottom) isBellow = 1;
	}
	if(isBellow){
		var count = 0;
		while(!place_meeting(x,y+sign(vsp),ss) && !place_meeting(x,y+sign(vsp),ob) && count < abs(vsp)){
			y+=sign(vsp);
			count++;
		}
		event_user(ev);
	}
}