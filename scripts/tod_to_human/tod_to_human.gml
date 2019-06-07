var humanTime = argument0*86400;

var hour = humanTime/3600;
var mins = (hour-floor(hour))*60;

return string(floor(hour))+":"+string(floor(mins));
