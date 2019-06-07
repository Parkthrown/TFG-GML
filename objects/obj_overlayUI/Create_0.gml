/// @description Insert description here
// You can write your code in this editor
target = Wax;
doDraw = 1;
hasResetted = 1;
flameType = 0;
weapon = lw_sword();
projectile = lw_sword_projectile();
HP = 0;
shots = 0;
surf = surface_create(GAME_WIDTH,GAME_HEIGHT);
targetWeapon = 0;
targetProjectile = 0;
if(instance_exists(target)){
	HP = target.HP;
	flameType = target.flameType;
	shots = target.shots;
}

event_user(0);