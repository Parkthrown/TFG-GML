/// @description Insert description here
// You can write your code in this editor
if(!doDraw) exit;
if(surface_exists(global.uiSurf)){
	draw_set_font(fnt_base);
	draw_set_halign(fa_center);
	surface_set_target(global.uiSurf);
		draw_set_color(c_black);
		draw_rectangle(0,0,GAME_WIDTH,18,0);
		draw_set_color(c_white);
		draw_sprite(spr_ui_main_frame,0,0,4);
		for(var i = 0; i < 2; ++i) {
			draw_sprite(spr_weapons_frame,i,65+21*i,8);
		}
		shader_set(sh_flameType);
		flameType_set_palette(flameType);	
			for(var i = 0; i < HP; i++) {
				draw_sprite(spr_hp_flame,TIMER*12 + i, 18 + 7 * i , 23 - i );
			}
			draw_sprite(spr_coin,(TIMER*8)&7,368,8);
			draw_surface(surf,0,0);
		shader_reset();
	draw_sprite(spr_bullet_clip,0,10,20);
	draw_text(240,4,tod_to_human(global.time));
	surface_reset_target();
}else{
	global.uiSurf = surface_create(GAME_WIDTH,GAME_HEIGHT);
}

draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(fnt_base);