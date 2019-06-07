///@func get_next_frame
///@desc returns the next frame

return floor(image_index + image_speed * sprite_get_speed(sprite_index) / (room_speed));