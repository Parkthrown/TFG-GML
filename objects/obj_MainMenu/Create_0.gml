/// @description Insert description here
// You can write your code in this editor
var width = GAME_WIDTH;
var height = GAME_HEIGHT;

selected = 0;

downUp = 0;

file = 0;

menus = ds_map_create();

actual = MENU_INITIAL;
prev = ds_list_create();
next = 0;
timer = 100;

var mainMenu = ds_list_create();
ds_list_add(mainMenu, MENU_PRESS_ANY_KEY);
ds_map_add_list(menus,MENU_INITIAL,mainMenu);


var mainMenu = ds_list_create();
ds_list_add(mainMenu,
MENU_START_GAME,
MENU_SETTINGS,
MENU_CONTROLS,
MENU_EXIT);
ds_map_add_list(menus,MENU_MAIN,mainMenu);

var starto = ds_list_create();
ds_list_add(starto,
MENU_SINGLE_PLAYER);
ds_map_add_list(menus,MENU_START_GAME,starto);

files = ds_list_create();
load_saveFiles(files);
ds_map_add_list(menus,MENU_SINGLE_PLAYER,files);

var settingsMenu = ds_list_create();
ds_list_add(settingsMenu,
MENU_SOUND,
MENU_SCREENSHAKE);
ds_map_add_list(menus,MENU_SETTINGS,settingsMenu);

var soundMenu = ds_list_create();
ds_list_add(soundMenu,
MENU_SFX,
MENU_MUSIC);
ds_map_add_list(menus,MENU_SOUND,soundMenu);

var contMenu = ds_list_create();
ds_list_add(contMenu,
MENU_KEYBOARD,
MENU_CONTROLLER);
ds_map_add_list(menus,MENU_CONTROLS,contMenu);

var kList = ds_list_create();

kList[|0] = [CONTROLS_JUMP_NAME,CONTROLS_JUMP];
kList[|1] = [CONTROLS_RIGHT_NAME,CONTROLS_RIGHT];
kList[|2] = [CONTROLS_LEFT_NAME,CONTROLS_LEFT];
kList[|3] = [CONTROLS_INTERACT_NAME,CONTROLS_INTERACT];
kList[|4] = [CONTROLS_CROUCH_NAME,CONTROLS_CROUCH];
kList[|5] = [CONTROLS_ATTACK_NAME,CONTROLS_ATTACK];
kList[|6] = [CONTROLS_ROLL_NAME,CONTROLS_ROLL];
kList[|7] = [CONTROLS_GRAB_NAME,CONTROLS_GRAB];
kList[|8] = [CONTROLS_PAUSE_NAME,CONTROLS_PAUSE];

ds_map_add_list(menus,MENU_KEYBOARD,kList);

var cOList = ds_list_create();

cOList[|0] = MENU_MODE;
cOList[|1] = MENU_CONTROLLER_BINDINGS;

ds_map_add_list(menus,MENU_CONTROLLER,cOList);

var cList = ds_list_create();

cList[|0] = [CONTROLS_JUMP_NAME,CONTROLS_JUMP];
cList[|1] = [CONTROLS_INTERACT_NAME,CONTROLS_INTERACT];
cList[|2] = [CONTROLS_CROUCH_NAME,CONTROLS_CROUCH];
cList[|3] = [CONTROLS_ATTACK_NAME,CONTROLS_ATTACK];
cList[|4] = [CONTROLS_ROLL_NAME,CONTROLS_ROLL];
cList[|5] = [CONTROLS_GRAB_NAME,CONTROLS_GRAB];
cList[|6] = [CONTROLS_PAUSE_NAME,CONTROLS_PAUSE];

ds_map_add_list(menus,MENU_CONTROLLER_BINDINGS,cList);

var extMenu = ds_list_create();
ds_list_add(extMenu,MENU_NO,MENU_YES);
ds_map_add_list(menus,MENU_EXIT,extMenu);

event_user(0);
alarm_set(1,15);