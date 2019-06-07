var ev = (sign(vsp) == 1) ? events.collisionBottom: events.collisionTop;
if collide_at(x+hsp,y){
	event_user(events.collisionH);
}
x+=hsp;
if collide_at(x,y+vsp){
	event_user(ev);
}


if(place_meeting(x,y+vsp,obj_semiSolid) || place_meeting(x,y+vsp,obj_box)){
	var isBellow = 0;
	var ss = instance_place(x,y+vsp,obj_semiSolid);
	var ob = instance_place(x,y+vsp,obj_box);
	if(instance_exists(ss)){
		isBellow = (ss.bbox_top > bbox_bottom) ? 1: 0;
	}else if(instance_exists(ob)){
		isBellow = (ob.bbox_top > bbox_bottom) ? 1: 0;
	}
	if(isBellow){
		event_user(ev);
	}
}
y+=vsp;