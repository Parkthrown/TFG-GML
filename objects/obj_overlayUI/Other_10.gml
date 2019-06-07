/// @description Insert description here
// You can write your code in this editor
if(surface_exists(surf)){
	surface_clear(surf);
	draw_set_font(fnt_base);
	surface_set_target(surf);
	waxUi_draw_key_region();
	waxUi_draw_pickups();
	waxUi_draw_bullets();
	if(ds_exists(weapon,ds_type_map)){
		draw_sprite(spr_weapons,weapon[?weaponData.type],66,9);
		draw_sprite(spr_weapons,projectile[?projectileData.type],87,9);
	}
	surface_reset_target();
	draw_set_color(c_white);
	draw_set_font(fnt_base);
	if(instance_exists(target)){
		HP = target.HP;
		flameType = target.flameType;
		shots = target.shots;
	}
}else{
	surf = surface_create(GAME_WIDTH,48);
}