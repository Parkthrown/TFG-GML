///@func frame_end()
///@desc returns true when the next frame will be the desired frame or any frame above it
///@arg frame

return ((image_index + image_speed * sprite_get_speed(sprite_index) / (room_speed)) >= argument0 + 1) && (image_index < argument0 + 1);