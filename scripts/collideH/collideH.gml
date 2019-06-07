var cmap = CMAP;
var bbox = (hsp>0) ? bbox_right: bbox_left;

if(in_slope_at(x+hsp,y)){
	if(collision_tiles(cmap,x+hsp,bbox_bottom)){
		y = tile_get_height_at_pixel(cmap,x+hsp,bbox_bottom) - 1 - BBOX_BOTTOM_DISTANCE;
	}
	if(collision_tiles(cmap,bbox+hsp,y)){
		event_user(events.collisionH);
	}
	if place_meeting(x+hsp,y,obj_solid){
		repeat(abs(hsp)){
			if (place_meeting(x+sign(hsp),y,obj_solid)) break;
			x+=sign(hsp);
		}
		event_user(events.collisionH);
	}
}else{
	//TODO:
	//OPTIMIZAR ESTO CHECK SOLO PARA LOS 3 PUNTOS RELEVANTES EN HSP
	/*
	var colpoint = ((sign(hsp)) ? bbox_right: bbox_left);
	if (place_meeting(x+hsp,y,obj_solid) || collision_points_tilemap(cmap,[colpoint + hsp, bbox_bottom],[colpoint + hsp,y],[colpoint + hsp,bbox_top])){
		repeat(abs(hsp)){
			if (place_meeting(x + sign(hsp),y,obj_solid) || collision_points_tilemap(cmap,[colpoint + sign(hsp), bbox_bottom],[colpoint + sign(hsp),y],[colpoint + sign(hsp),bbox_top])) break;
			x+=sign(hsp);
		}
		event_user(events.collisionH);
	}*/
	if (collide_at(x+hsp,y)){
		repeat(abs(hsp)){
			if (collide_at(x+sign(hsp),y)) break;
			x+=sign(hsp);
		}
		event_user(events.collisionH);
	}
}
