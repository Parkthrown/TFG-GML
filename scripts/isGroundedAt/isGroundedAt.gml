///@argument0 x
///@argument1 y
var cmap = CMAP;

var xx = x;
var yy = y;

x = argument0;
y = argument1;

var grounded = isGrounded();

x = xx;
y = yy;

return grounded;