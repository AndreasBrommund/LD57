if keyboard_check_pressed(vk_up) {
	motion_set(90, velocity);
}

if keyboard_check_pressed(vk_down) {
	motion_set(270, velocity);
}

if keyboard_check_pressed(vk_right) {
	motion_set(0, velocity);
}

if keyboard_check_pressed(vk_left) {
	motion_set(180, velocity);
}

move_wrap(true, false, 0);

if direction > 90 && direction < 270 {
	image_xscale = -1;
} else if (direction == 90 || direction == 270){
	image_xscale = image_xscale;
} else {
	image_xscale = 1;	
}

 