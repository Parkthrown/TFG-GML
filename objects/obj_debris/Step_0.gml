/// @description
// You can write your code in this 
image_xscale = sign(image_xscale) * min(alarm[2]/100,1);
image_yscale = image_xscale;
if(!isGrounded()){
	rot += ((vsp/5)+(hsp/5))*random(5);
	vsp += (global.grav*weight/floatyness);
	hsp = lerp(hsp,0,0.005);
}
SimpleCollision();
