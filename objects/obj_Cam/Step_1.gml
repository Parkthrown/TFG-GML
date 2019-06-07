/// @description Insert description here
// You can write your code in this editor
if(global.debug){
	if(keyboard_check(vk_add)){
		var range = floor((room_width+room_height)/(width+height));
		var nwidth = lerp(width,width*range,0.1);
		var nheight =  lerp(height,height*range,0.1);
		if(nwidth < room_width && nheight < room_height){
			width = floor(nwidth);
			height = floor(nheight);
			camera_set_view_size(camera,width,height);
			camera_set_view_pos(camera,x-width/2,(y-height/2)-dist);
			
		}
	}else if(keyboard_check(vk_subtract)){
		width = lerp(width,bWidth,0.5);
		height = lerp(height,bHeight,0.5);
		camera_set_view_size(camera,width,height);
		camera_set_view_pos(camera,x-width/2,(y-height/2)-dist);

	}
}

switch(state){
	case 0:
		if instance_exists(follow){
			if(!lock_x) hsp = (follow.x - x)/spd;
			if(!lock_y) vsp = (follow.y -y)/spd;
		}
	break;
	case 1:
		if(is_array(vec) && array_length_1d(vec)>=2){
			if(!lock_x) hsp = (vec[0] - x)/spd;
			if(!lock_y) vsp = (vec[1] -y)/spd;
		}
	break;
	case 2:
		if(is_array(vec) && array_length_1d(vec)>=2){
			if(!lock_x) hsp = (vec[0] - x)/spd;
			if(!lock_y) vsp = (vec[1] -y)/spd;
		}
	break;
}

if(sway){
	hsp+=cos(TIMER/2.);
	vsp+=sin(TIMER/3.);
}

x += hsp
y += vsp
x = clamp(x,width/2,room_width-(width/2));
y = clamp(y,height/2,room_height-(height/2) + dist);
camera_set_view_size(camera,width,height);
camera_set_view_pos(camera,x-width/2,(y-height/2)-dist);
			
#region parallax
xReal = x - width/2;
yReal = y - height/2 -dist;
#region regular parallax
for(var i= 0; i<ds_list_size(global.parallax_list);i++){
	var bgid = layer_get_id(ds_list_find_value(global.parallax_list,i));
	if(layer_background_get_id(bgid)){
		var bgWidth = background_sprite_width(bgid); 
		var bgBoundX = bgWidth - width;
		var bgHeight = background_sprite_height(bgid);
		var bgBoundY = bgHeight - height;
		var bgX = xReal -(x/(room_width/100))*(bgBoundX/100)
		var bgY = yReal -(y/(room_height/100))*(bgBoundY/100)
		layer_x(bgid,bgX);
		layer_y(bgid,bgY);
	}else{
		var bgWidth = room_width; 
		var bgBoundX = bgWidth - width;
		var bgHeight = room_height;
		var bgBoundY = bgHeight - height;
		var bgX = xReal -(x/(room_width/100))*(bgBoundX/100)
		var bgY = yReal -(y/(room_height/100))*(bgBoundY/100)
		layer_x(bgid,bgX);
		layer_y(bgid,bgY);
	}
}
#endregion
#region complex parallax
var i = ds_map_find_first(global.complexParallaxMap);
while(i != undefined){
	var bgid = layer_get_id(i);
	var vArr = global.complexParallaxMap[?i];
	if(is_array(vArr)){
		var sprWidth = vArr[2];
		var bgWidth = vArr[0];
		var bgHsp = layer_get_hspeed(bgid);
		if(bgHsp!=0){
			vArr[4] = (vArr[4] == undefined) ? 0: 
			((vArr[4]+bgHsp > sprWidth) ? 0: vArr[4]+bgHsp);
		}
		var bgBoundX = bgWidth - width;
		var sprHeight = vArr[3];
		var bgHeight = vArr[1];
		var bgVsp = layer_get_vspeed(bgid);
		if(bgVsp!=0){
			vArr[5] = (vArr[5] == undefined) ? 0: 
			((vArr[5]+bgVsp > sprHeight) ? 0: vArr[5]+bgVsp);
		}
		var bgBoundY = bgHeight - height;
		var bgX = xReal -(x/(room_width/100))*(bgBoundX/100);
		var bgY = yReal -(y/(room_height/100))*(bgBoundY/100);
			
		if(bgWidth){
			if(vArr[4] != undefined){
				bgX+= vArr[4];
			}
			layer_x(bgid,bgX);
		}
		if(bgHeight){
			if(vArr[5] != undefined){
				bgY+= vArr[5];
			}
			layer_y(bgid,bgY);
		}
		global.complexParallaxMap[?i] = vArr;
	}
	i = ds_map_find_next(global.complexParallaxMap,i);
}
#endregion
#endregion

