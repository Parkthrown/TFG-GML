event_inherited();
creator = 0;
flameType = 0;
self_Damage = 1;
hsp = 0;
vsp = 0;
damage = 1;
knockback = 1;
HP = 1;
baseSpeed = 6;
bouncy = 0;
hbox = ds_list_create();
iFrames = 5;

//set self-destruction
depth=get_depth_map();
alarm_set(0,18);
alarm_set(1,8);
