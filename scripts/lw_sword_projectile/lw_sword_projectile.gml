
var sword_projectile = ds_map_create();
sword_projectile[?projectileData.type] = weapons.Sword;
sword_projectile[?projectileData.cost] = 1;
sword_projectile[?projectileData.actor] = obj_swordBeam;

return sword_projectile;