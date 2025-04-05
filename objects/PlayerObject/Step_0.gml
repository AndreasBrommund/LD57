if keyboard_check(vk_up) {
	motion_set(90, velocity);
	if (image_xscale == 1) {
		image_angle = 90;
	}
	if (image_xscale == -1) {
		image_angle = 270;
	}
	
}

if keyboard_check(vk_down) {
	motion_set(270, velocity);
	if (image_xscale == 1) {
		image_angle = 270;
	}
	if (image_xscale == -1) {
		image_angle = 90;
	}
}

if keyboard_check(vk_right) {
	motion_set(0, velocity);
	image_angle = 0;
	image_xscale = 1;
	
}

if keyboard_check(vk_left) {
	motion_set(180, velocity);
	image_angle = 0;	
	image_xscale = -1;
}


// Now add this check to stop the sprite when no keys are pressed
if (!keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right)) {
    speed = 0;
}

move_wrap(true, false, 0);
