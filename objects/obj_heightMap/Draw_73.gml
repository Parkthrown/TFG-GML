/// @description Insert description here
// You can write your code in this editor

var size = TILE_SIZE*TILE_MAX;

global.heights = [];

var surf = surface_create(size,TILE_SIZE);
var buff = buffer_create(size*TILE_SIZE*4,buffer_fixed,1);

surface_set_target(surf);
draw_clear_alpha(0,0);

for(var i = 0; i < TILE_MAX; i++) {
	draw_tile(ts_cMap,i,0,i*TILE_SIZE,0);
}

surface_reset_target();
buffer_get_surface(buff,surf,0,0,0);
for (var i = 0; i < size; i++) {
	var count = 0;
	    for (var j = 0; j < size; j++) {
			var px = buffer_peek(buff,(i+(j*size))*4,buffer_u32);
			if((px && px&0xff000000) != 0) break;
			count++;
			
		}
		global.heights[i] = count;
}

var s = "";
for (var i = 0; i < size; ++i) {
    s+=","+string(global.heights[i]);
}

show_debug_message(s);
surface_free(surf);
buffer_delete(buff);

room_goto_next();