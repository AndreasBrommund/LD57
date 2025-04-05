image_angle = direction

if (y > room_height) {
	 y = sprite_height;
	 path_start(path, velocity, path_action_continue, false)
}

if (y < 0) {
	 y = room_height - sprite_height;
	 path_start(path, velocity, path_action_continue, false)
}

if (x > room_width) {
	 x = sprite_width;
	 path_start(path, velocity, path_action_continue, false)
}

if (x < 0) {
	 x = sprite_width;
	 path_start(path, velocity, path_action_continue, false)
}