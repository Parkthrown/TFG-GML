///@argument0 type
switch(argument[0]){
	case uiData.HP:
		HP = argument[1];
		surface_set_target(surf);
			waxUi_draw_health(HP);
		surface_reset_target();
	break;
	case uiData.Keys:
		surface_set_target(surf);
			waxUi_draw_key_region(surface_get_width(surf))
		surface_reset_target();
	break;
	case uiData.Pickups:
		surface_set_target(surf);
			waxUi_draw_pickups(surface_get_width(surf));
		surface_reset_target();
		event_user(0);
	break;
	case uiData.Shots:
		shots = argument[1];
		surface_set_target(surf);
			waxUi_draw_bullets(shots);
		surface_reset_target();
	break;
	case uiData.Weapon:
		weapon = argument[1];
		surface_set_target(surf);
			waxUi_draw_weapon(weapon);
		surface_reset_target();
		event_user(0);
	break;
	case uiData.flameType:
		flameType = argument[1];
	break;
}