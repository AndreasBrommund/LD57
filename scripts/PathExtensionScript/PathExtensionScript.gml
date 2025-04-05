function handle_path_out_of_room(path, velocity){
	var offset_y = sprite_height;
	var offset_x = sprite_width;

	if (y > room_height + offset_y) {
		 y = 0;
		 path_start(path, velocity, path_action_continue, false)
	}

	if (y < -offset_y) {
		 y = room_height;
		 path_start(path, velocity, path_action_continue, false)
	}

	if (x > room_width + offset_x) {
		 x = 0;
		 path_start(path, velocity, path_action_continue, false)
	}

	if (x < -offset_x) {
		 x = room_width;
		 path_start(path, velocity, path_action_continue, false)
	}
}