///@descripton adds a key time (like key frames) to the day and night cycle
///@param R
///@param G
///@param B
///@param con
///@param sat
///@param brt
///@param pop_strength
///@param pop_threshold

var i = array_length_1d(color);

var arr = [];
var arrcol = [];
arrcol[0] = argument0/255;
arrcol[1] = argument1/255;
arrcol[2] = argument2/255;
color[i] = arrcol;

arr[0] = argument3;
arr[1] = argument4;
arr[2] = argument5;

arr[3] = argument6;
arr[4] = argument7;

con_sat_brt[i] = arr;
