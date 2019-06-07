/// @description Insert description here
// You can write your code in this editor
event_inherited();
HP = 1;
inmune = 1;

x_path = [0,0];

y_path = [0,0];

current_paths = [0,0];

delay = 10;
x_accel = 0.01;
y_accel = 0.01;

hsp = 0;
vsp = 0;

maxhsp = 2;
maxvsp = 2;

damage = 1;
knockback = 5;
hbox = ds_list_create();
alarm_set(0,1);