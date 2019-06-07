///@argument0 width
draw_sprite(spr_vessel,0,318,8);
draw_sprite(spr_x,0,372,1);
draw_sprite(spr_x,0,324,1);
var coinstext = (global.coins > 1000) ? "999+": string(global.coins);
draw_text(390,5,coinstext);
draw_text(342,5,ds_list_size(global.vessels));