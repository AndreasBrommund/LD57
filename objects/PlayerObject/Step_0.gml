if keyboard_check_pressed(vk_up) {
	motion_set(90, velocity);
	if (image_xscale == 1) {
		image_angle = 90;
	}
	if (image_xscale == -1) {
		image_angle = 270;
	}
	
}

if keyboard_check_pressed(vk_down) {
	motion_set(270, velocity);
	if (image_xscale == 1) {
		image_angle = 270;
	}
	if (image_xscale == -1) {
		image_angle = 90;
	}
}

if keyboard_check_pressed(vk_right) {
	motion_set(0, velocity);
	image_angle = 0;
	image_xscale = 1;
	
}

if keyboard_check_pressed(vk_left) {
	motion_set(180, velocity);
	image_angle = 0;	
	image_xscale = -1;
}

move_wrap(true, false, 0);
