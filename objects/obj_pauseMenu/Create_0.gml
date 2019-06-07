/// @description Insert description here
// You can write your code in this editor
//text
textHeight = 0;
textDirection = 0;
downUp = 0;
//

selected = 0;
alarm_set(1,9);
menus = ds_map_create();
actual = MENU_MAIN;
prev = ds_list_create();
prev[|0]=MENU_MAIN;

var mainMenu = ds_list_create();
mainMenu[|0] = "UNPAUSE";
mainMenu[|1] = MENU_SETTINGS;
mainMenu[|2] = MENU_CONTROLS;
mainMenu[|3] = MENU_EXIT;

ds_map_add_list(menus,MENU_MAIN,mainMenu);

var optMenu = ds_list_create();
optMenu[|0] = MENU_SOUND;
optMenu[|1] = MENU_SCREENSHAKE;

ds_map_add_list(menus,MENU_SETTINGS,optMenu);

var soundMenu = ds_list_create();
soundMenu[|0] = MENU_SFX;
soundMenu[|1] = MENU_MUSIC;

ds_map_add_list(menus,MENU_SOUND,soundMenu);

var contMenu = ds_list_create();
contMenu[|0] = MENU_KEYBOARD;
contMenu[|1] = MENU_CONTROLLER;

ds_map_add_list(menus,MENU_CONTROLS,contMenu);

var kList = ds_list_create();

kList[|0] = CONTROLS_JUMP;
kList[|1] = CONTROLS_RIGHT;
kList[|2] = CONTROLS_LEFT;
kList[|3] = CONTROLS_INTERACT;
kList[|4] = CONTROLS_CROUCH;
kList[|5] = CONTROLS_ATTACK;
kList[|6] = CONTROLS_ROLL;
kList[|7] = CONTROLS_GRAB;
kList[|8] = CONTROLS_PAUSE;

ds_map_add_list(menus,MENU_KEYBOARD,kList);

var cOList = ds_list_create();

cOList[|0] = MENU_MODE;
cOList[|1] = MENU_CONTROLLER_BINDINGS;

ds_map_add_list(menus,MENU_CONTROLLER,cOList);

var cList = ds_list_create();

cList[|0] = CONTROLS_JUMP;
cList[|1] = CONTROLS_INTERACT;
cList[|2] = CONTROLS_CROUCH;
cList[|3] = CONTROLS_ATTACK;
cList[|4] = CONTROLS_ROLL;
cList[|5] = CONTROLS_GRAB;
cList[|6] = CONTROLS_PAUSE;

ds_map_add_list(menus,MENU_CONTROLLER_BINDINGS,cList);

var extMenu = ds_list_create();
extMenu[|0] = MENU_NO;
extMenu[|1] = MENU_YES;

ds_map_add_list(menus,MENU_EXIT,extMenu);