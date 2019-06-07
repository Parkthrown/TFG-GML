/// @description Insert description here
// You can write your code in this editor
var modif = 0;
var width = GAME_WIDTH;
var height = GAME_HEIGHT;
var optionsBoxHeight = TILE_SIZE*7;

with(obj_Cam){
	var hMid = x;
	var vMid = y-dist;
}

var current_timer = clamp(alarm[2],0,timer);
var animation_time = (timer-current_timer)/timer;

if(!surface_exists(global.uiSurf)){
	global.uiSurf = surface_create(GAME_WIDTH,GAME_HEIGHT);
}

switch(actual){
	
	#region initial
	case MENU_INITIAL:
		var list = menus[?actual];
		draw_set_halign(fa_center);
		draw_set_font(fnt_base);
		draw_set_alpha(floor((current_time/100))%3);
		draw_text(hMid,vMid*1.3,list[|0]);
		draw_set_alpha(1);
		draw_set_halign(fa_left);
	break;
	#endregion
	#region singleplayer
	case MENU_SINGLE_PLAYER:
	
	break;
	#endregion
	#region default
	default:
		if(ds_exists(menus[?actual],ds_type_list)){
			var list = menus[?actual];
			var tLen = string_length(actual);
			var spacing = max(((tLen*8)/2)+8,48);
			var size = ds_list_size(list);
			draw_set_halign(fa_center);
			draw_set_font(fnt_base);
			draw_set_color(c_white);
			draw_nineSlice(spr_9slice_menu,hMid-80,vMid+6,hMid+80,vMid+optionsBoxHeight);
			draw_nineSlice(spr_9slice_menu,hMid-floor(spacing*1.25),vMid+12,hMid+floor(spacing*1.25),vMid+28);
			draw_text(hMid,vMid+16,actual);
			var i = 0;
			while(i < size){
				var item = ds_list_find_value(menus[?actual],i);
				var text = (is_array(item)) ? item[0]: item;
				tLen = string_length(text);
				spacing = max(((tLen*8)/2)+8,48);
				
				if (i == selected){
					if(current_timer){
						shader_set(sh_forcedPalette);
							var pal = shader_get_sampler_index(sh_forcedPalette,"u_sPalette");
							texture_set_stage(pal,global.cubeMap);
							var percent = shader_get_uniform(sh_forcedPalette,"u_fLight");
							shader_set_uniform_f(percent,1.15-animation_time);
							draw_nineSlice(spr_9slice_menu,hMid-spacing,vMid+34+i*16,hMid+spacing,vMid+50+i*16);
							draw_set_color(color);
							draw_text(hMid-1,vMid+39+i*16,text);
							draw_set_color(c_white);
							draw_text(hMid,vMid+38+i*16,text);
						shader_reset();
					}else{
						draw_nineSlice(spr_9slice_menu,hMid-spacing,vMid+34+i*16,hMid+spacing,vMid+50+i*16);
						draw_set_color(color);
						draw_text(hMid-1,vMid+39+i*16,text);
						draw_set_color(c_white);
						draw_text(hMid,vMid+38+i*16,text);
					}
				}else{
					draw_nineSlice(spr_9slice_menu,hMid-spacing,vMid+34+i*16,hMid+spacing,vMid+50+i*16);
					draw_set_color(c_gray);
					draw_text(hMid,vMid+38+i*16,text);
				}
				i++;
			}
		}
		draw_set_halign(fa_left);
	break;
	#endregion
	
}
draw_set_color(c_white);
