/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

var sWidth = GAME_WIDTH;
var sHeight = GAME_HEIGHT;
var centerY = sHeight/2;
var centerX = sWidth/2;

shader_set(sh_brightness);
var percent = shader_get_uniform(sh_brightness,"percent");
shader_set_uniform_f(percent,-0.05);
display_set_gui_size(sprite_get_width(pimg),sprite_get_height(pimg));
draw_sprite_ext(pimg,0,0,0,1,1,0,c_white,alpha);
shader_reset(); 
display_set_gui_size(sWidth,sHeight);

var list = menus[?actual];
if(textDirection == 0){
	textHeight = lerp(textHeight,8,0.005);
	if(textHeight >= 7){
		textDirection = 1;
	}
}else{
	textHeight = lerp(textHeight,-8,0.005);
	if(textHeight <= -7){
		textDirection = 0;
	}
}
draw_set_font(fnt_base);
draw_set_color(c_white);
switch(actual){
	default:
	draw_set_halign(fa_center);
		for(var i = 0; i<ds_list_size(list); i++){
			if(i == selected){
				draw_set_color(c_white);
			}else{
				draw_set_color(c_gray);
			}
			draw_text(centerX,centerY-(8*(ds_list_size(list)-1))+textHeight+16*i,list[|i]);
		}
		draw_sprite(WaxFall,TIMER*6,centerX-(string_length(list[|selected])*3)-16,centerY-(8*(ds_list_size(list)-1))+textHeight+16*selected+4);
		draw_set_halign(fa_left);
	break;
	case MENU_MAIN :
	draw_set_halign(fa_left);
		draw_sprite_ext(MenuArrows,downUp == -1,centerX-44,centerY-12+textHeight,1,1,0,c_white,100);
		draw_sprite_ext(MenuArrows,bool(downUp),centerX-44,centerY+30+textHeight,1,-1,0,c_white,100);
		draw_text(centerX-24,centerY+textHeight+4,list[|selected]);
		draw_set_font(fnt_base);
		draw_set_color(c_gray);
			
		if(selected < ds_list_size(list)-1){
			draw_text(centerX-26,centerY+16+textHeight,list[|selected+1]);
		}else{
			draw_text(centerX-26,centerY+16+textHeight,list[|0]);
		}
			
		if(selected > 0){
			draw_text(centerX-26,centerY-8+textHeight,list[|selected-1]);
		}else{
			draw_text(centerX-26,centerY-8+textHeight,list[|ds_list_size(list)-1]);
		}
			draw_set_font(fnt_base);
			draw_set_color(c_white);
	break;
}

if(global.debug ==1){
	draw_text(centerX+140,centerY-100,string(fps_real) + "fps");
}

draw_set_alpha(1);
draw_set_color(c_white);