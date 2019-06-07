///@desc lighweight sword object

var weapon_sword = ds_map_create();
weapon_sword[?weaponData.type] = weapons.Sword;
weapon_sword[?weaponData.damage] = 1;
weapon_sword[?weaponData.knockback] = 5;
weapon_sword[?weaponData.inits] = 
	[generic_slash_init,
	generic_airSlash_init,
	sword_roll_init,
	generic_downAir_init,
	generic_dashSlash_init];
weapon_sword[?weaponData.attacks] = [sword_slash,sword_airSlash,-1,sword_downAir,sword_dashSlash];
weapon_sword[?weaponData.animations] = [WaxSlash,WaxSlash,WaxRollSlice,WaxDownAir,WaxDashSlash];
weapon_sword[?weaponData.effects] = [WaxSlashDeco,WaxSlashDeco,-1,WaxDownAirDeco,WaxDashSlashDeco];
weapon_sword[?weaponData.parry] = -1;

show_debug_message(weapon_sword);
return weapon_sword;