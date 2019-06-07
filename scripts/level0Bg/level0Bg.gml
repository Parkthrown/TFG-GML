var l1 = layer_create(900,"bg1");
var bg = layer_background_create(l1,spr_l0bg1);
layer_background_htiled(bg,1);
layer_background_vtiled(bg,1);
layer_hspeed(l1,0.04);

var l2 = layer_create(899,"bg2");
var bg2 = layer_background_create(l2,spr_l0bg2);
layer_background_htiled(bg2,1);
layer_background_vtiled(bg2,1);
layer_hspeed(l2,0.08);

complex_add("bg1",512,280,512,280);
complex_add("bg2",528,280,512,280);