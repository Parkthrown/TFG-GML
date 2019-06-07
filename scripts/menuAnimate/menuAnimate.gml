///@desc Animate without switching
///@argument animation
///@argument coolDown
///@argument effect?

alarm_set(uiAlarms.effects,1);
timer = argument[0];
alarm_set(uiAlarms.animations,timer);
if((argument_count > 1)) alarm_set(uiAlarms.cooldown,argument[1]);
next = undefined;
//switchEffect();
