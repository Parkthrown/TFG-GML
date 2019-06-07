/// @description Insert description here
// You can write your code in this editor

pOutline = rgbToGlsl(color_to_array(C_NES_GRAY));
particlePalette = make_gl_palette(C_NES_ORANGE,make_color_rgb(162,48,0),make_color_rgb(63,9,4),);
u_Color = shader_get_uniform(sh_paletteSwap,"u_vColors");
global.partList = ds_list_create();

surf = surface_create(GAME_WIDTH,GAME_HEIGHT);
sysDrawList = ds_list_create();

ds_list_add(sysDrawList,global.part_system_front);

sysUpdateList = ds_list_create();

ds_list_add(sysUpdateList,global.part_system_light);
ds_list_add(sysUpdateList,global.part_system_gui);

#region systems

emberSystems = ds_list_create();
for(var i = 0; i < 6; i++){
	var system = part_system_create();
	part_system_depth(system,99);
	part_system_automatic_draw(system,0);
	part_system_automatic_update(system,0);
	ds_list_add(emberSystems,system);
}

#endregion

#region particles

#region light particles
	partLight16px = part_type_create();
	part_type_sprite(partLight16px,spr_lightMask16x,1,1,0);
	part_type_size(partLight16px,1,1,0,0);
	part_type_color2(partLight16px,c_white,c_black);
	part_type_speed(partLight16px,0.75,0.75,-0.01,0);
	part_type_direction(partLight16px,0,360,0,0);
	part_type_life(partLight16px,22,35);
#endregion

#region stars
partStar = part_type_create();
part_type_sprite(partStar,Star,1,1,0);
part_type_size(partStar,1,1,0,0);
part_type_speed(partStar,0.75,0.75,-0.01,0);
part_type_direction(partStar,0,360,0,0);
part_type_gravity(partStar,0.005,90);
part_type_life(partStar,16,24);




#endregion

#region embers

	emberPart = part_type_create();
	part_type_sprite(emberPart,spr_ember,1,1,1);
	part_type_size(emberPart,1,1,-0.005,0.15);
	part_type_speed(emberPart,-0.1,0.1,0,0);
	part_type_direction(emberPart,0,360,0,5);
	part_type_gravity(emberPart,0.005,90);
	part_type_life(emberPart,15,25);
	
coloredEmbers = ds_list_create();

#macro partember obj_partManager.coloredEmbers[|1]

#region coloreed embers
for(var i = 0; i<6; i++){
	var color = global.palettes[|i];
	var ember = part_type_create();
	part_type_sprite(ember,emberParticle,1,1,1);
	part_type_size(ember,1,1,-0.005,0.15);
	part_type_color3(ember,color[2],color[1],color[0]);
	part_type_speed(ember,-0.1,0.1,0,0);
	part_type_direction(ember,0,360,0,5);
	part_type_gravity(ember,0.005,90);
	part_type_life(ember,20,45);
	ds_list_add(coloredEmbers,ember);
}
#endregion

#endregion

#region flame

	flamePart = part_type_create();
	part_type_sprite(flamePart,spr_flameEffect,1,1,0);
	part_type_orientation(flamePart,-45,35,0.01,0.01,0.);
	part_type_speed(flamePart,-0.1,0.1,0,0);
	part_type_direction(flamePart,0,360,0,5);
	part_type_gravity(flamePart,0.005,90);
	part_type_life(flamePart,15,35);
	part_type_death(flamePart,2,emberPart);
	
	flamePartSpeed = part_type_create();
	part_type_sprite(flamePartSpeed,spr_flameEffect,1,1,0);
	part_type_size(flamePartSpeed,1,1,0,0);
	part_type_speed(flamePartSpeed,2.2,2.3,-0.08,0.03);
	part_type_direction(flamePartSpeed,0,360,0,0);
	part_type_gravity(flamePartSpeed,0.015,90);
	part_type_life(flamePartSpeed,35,45);
	part_type_death(flamePartSpeed,2,emberPart);
	
#endregion

#region bubbles
partBubble = part_type_create();
part_type_sprite(partBubble,BubbleThing,1,1,0);
part_type_size(partBubble,1,1,0,0);
part_type_speed(partBubble,0,0,0,0);
part_type_direction(partBubble,0,360,0,0);
part_type_gravity(partBubble,0.005,90);
part_type_life(partBubble,4,12);
#endregion

#region bubbles(state sleepy)
partSnotBubble = part_type_create();
part_type_sprite(partSnotBubble,spr_snotBubble,1,1,0);
part_type_size(partSnotBubble,1,1,0,0);
part_type_speed(partSnotBubble,0.05,0.1,0,0);
part_type_direction(partSnotBubble,0,180,0,0);
part_type_gravity(partSnotBubble,0.002,90);
part_type_life(partSnotBubble,180,220);
#endregion

#region heals
partHeal = part_type_create();
part_type_sprite(partHeal,spr_Heal,1,1,0);
part_type_size(partHeal,1,1,0,0);
part_type_speed(partHeal,0,0,0,0);
part_type_direction(partHeal,0,360,0,0);
part_type_gravity(partHeal,0.005,90);
part_type_life(partHeal,8,16);
#endregion

#region dust
partDust = part_type_create();
part_type_sprite(partDust,spr_dust,1,1,0);
part_type_size(partDust,1,1,0,0);
part_type_orientation(partDust,-45,45,0,1,0);
part_type_speed(partDust,0.2,0.2,0,0.05);
part_type_direction(partDust,0,180,0,0);
part_type_gravity(partDust,0.02,90);
part_type_life(partDust,24,30);

partSmallDust = part_type_create();
part_type_sprite(partSmallDust,spr_dust,1,1,0);
part_type_size(partSmallDust,0.5,0.5,-0.001,0);
part_type_orientation(partSmallDust,-45,45,0,1,0);
part_type_speed(partSmallDust,0.15,0.15,0,0.02);
part_type_direction(partSmallDust,0,180,0,0);
part_type_gravity(partSmallDust,0.015,90);
part_type_life(partSmallDust,24,30);

partLongDust = part_type_create();
part_type_sprite(partLongDust,spr_longDust,1,1,0);
part_type_size(partLongDust,1,0,0,0);
part_type_orientation(partLongDust,-45,45,0,1,0);
part_type_speed(partLongDust,0.2,0.2,0,0.05);
part_type_direction(partLongDust,0,180,0,0);
part_type_gravity(partLongDust,0.02,90);
part_type_life(partLongDust,18,25);
#endregion

#region smoke blasts
partSmokeBlast = part_type_create();
part_type_sprite(partSmokeBlast,spr_smokeblast,1,1,0);
part_type_size(partSmokeBlast,1,1,-0.01,0);
part_type_speed(partSmokeBlast,1.5,2,-0.1,0);
part_type_orientation(partSmokeBlast,0,360,0,2,0);
part_type_direction(partSmokeBlast,0,360,0,0);
part_type_gravity(partSmokeBlast,0.005,90);
part_type_life(partSmokeBlast,35,45);

partSmokeBlastSmall = part_type_create();
part_type_sprite(partSmokeBlastSmall,spr_smokeblast,1,1,0);
part_type_size(partSmokeBlastSmall,1,0.4,-0.01,0);
part_type_speed(partSmokeBlastSmall,1,1,-0.1,0);
part_type_orientation(partSmokeBlastSmall,0,360,0,2,0);
part_type_direction(partSmokeBlastSmall,0,360,0,0);
part_type_gravity(partSmokeBlastSmall,0.005,90);
part_type_life(partSmokeBlastSmall,22,32);
part_type_death(partSmokeBlast,5,partDust);
#endregion

#region explosions

partBlast = part_type_create();
part_type_sprite(partBlast,spr_blast,1,1,0);
part_type_size(partBlast,1,1,0,0);
part_type_life(partBlast,20,20);
#endregion

#region blood
	partBlood = part_type_create();
	part_type_sprite(partBlood,spr_blood,1,1,0);
	part_type_size(partBlood,1,1,0.005,0.001);
	part_type_orientation(partBlood,0,360,0,1,0);
	part_type_speed(partBlood,0.2,0.2,0,0.05);
	part_type_life(partBlood,14,14);
	
	partWaxHit = part_type_create();
	part_type_sprite(partWaxHit,spr_WaxHitEffect,1,1,0);
	part_type_size(partWaxHit,1,1,0.005,0.001);
	part_type_orientation(partWaxHit,0,360,0,1,0);
	part_type_speed(partWaxHit,0.5,0.5,0,0.08);
	part_type_life(partWaxHit,14,14);

#endregion

#region Wax particles
	partWaxLanding = part_type_create();
	part_type_sprite(partWaxLanding,spr_WaxLandingEffect,1,1,0);
	part_type_size(partWaxLanding,1,0,0.025,0);
	part_type_life(partWaxLanding,8,8);
	
	partWaxDash = part_type_create();
	part_type_sprite(partWaxDash,spr_WaxDashEffect,1,1,0);
	part_type_size(partWaxDash,1,0,0.,0);
	part_type_life(partWaxDash,8,8);
	
	partWaxGroundDash = part_type_create();
	part_type_sprite(partWaxGroundDash,spr_WaxGroundDashEffect,1,1,0);
	part_type_size(partWaxGroundDash,1,0,-0.01,0);
	part_type_life(partWaxGroundDash,8,8);
	
	partGroundBlastBig = part_type_create();
	part_type_sprite(partGroundBlastBig,spr_bigGroundBlast,1,1,0);
	part_type_size(partGroundBlastBig,1,0,-0.01,0);
	part_type_life(partGroundBlastBig,12,12);
	
	partGroundBlastMedium = part_type_create();
	part_type_sprite(partGroundBlastMedium,spr_bigGroundBlast,1,1,0);
	part_type_size(partGroundBlastMedium,.5,0,-0.01,0);
	part_type_life(partGroundBlastMedium,12,12);
#endregion

#endregion

#region octopus particles
partBubbles = part_type_create();
part_type_sprite(partBubbles,spr_bubbles,0,0,1);
part_type_speed(partBubbles,0.1,0.1,0,0.5);
part_type_direction(partBubbles,0,0,0,0.5);
part_type_gravity(partBubbles,0.015,90);
part_type_life(partBubbles,200,350);

partSBubbles = part_type_create()
part_type_sprite(partSBubbles,spr_smallBubbles,0,0,1);
part_type_speed(partSBubbles,0.1,0.1,0,0.1);
part_type_direction(partSBubbles,0,360,0,0.5);
part_type_life(partSBubbles,20,30);

partBigBlue = part_type_create()
part_type_sprite(partBigBlue,spr_BigBlue,1,1,0);
part_type_speed(partBigBlue,0,0,0,0.1);
part_type_direction(partBigBlue,0,0,0,0.1);
part_type_gravity(partBigBlue,0,0);
part_type_life(partBigBlue,20,25);

partChestSmoke = part_type_create()
part_type_sprite(partChestSmoke,spr_ChestSmoke,1,1,0);
part_type_speed(partChestSmoke,0,0,0,0.);
part_type_direction(partChestSmoke,0,0,0,0.);
part_type_gravity(partChestSmoke,0,0);
part_type_life(partChestSmoke,45,45);
#endregion

sysList = ds_list_create();
ds_list_add_list(sysList,sysUpdateList);
ds_list_add_list(sysList,sysDrawList);
ds_list_add_list(sysList,emberSystems);
alarm_set(0,180);