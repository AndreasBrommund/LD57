if keyboard_check(vk_up) {
	motion_set(90, velocity);
}

if keyboard_check(vk_down) {
	motion_set(270, velocity);
}

if keyboard_check(vk_right) {
	motion_set(0, velocity);
}

if keyboard_check(vk_left) {
	motion_set(180, velocity);
}

image_angle = direction;
image_yscale = direction > 90 && direction < 270 ? -1 : 1;

// Now add this check to stop the sprite when no keys are pressed
if (!keyboard_check(vk_up) && !keyboard_check(vk_down) && !keyboard_check(vk_left) && !keyboard_check(vk_right)) {
    speed = 0;
}

move_wrap(true, false, 0);

if speed != 0 {
	var ps = part_system_create(engineParticleSystem);	
	var ps_type = particle_get_info(ps).emitters[0].parttype.ind;
	var ps_x = x;
	var ps_y = y;
	var ps_gravity_direction = 0;
	
	if direction >= 0 && direction < 90 { //Right
		ps_x -= sprite_width/2;
		ps_y += 10;
		ps_gravity_direction = 90;
	} else if direction >= 90 && direction < 180 { //Up
		ps_x += sprite_width/6;
		ps_y += 30;
		ps_gravity_direction = 0;
	} else if direction >= 180 && direction < 270 { //Left
		ps_x += sprite_width*0.5;
		ps_y += 10;
		ps_gravity_direction = 270;
	} else { //Down
		ps_x -= sprite_width/6;
		ps_y -= 30;
		ps_gravity_direction = 180;
	}
	part_system_position(ps, ps_x, ps_y);
	part_system_angle(ps, direction);
	part_type_gravity(ps_type,0.1, ps_gravity_direction)
	
}
