
var horizontal_movement = 0;
var vertical_movement = 0;
if (keyboard_check(vk_right)) {
    horizontal_movement = 1;
    vertical_movement = 0;
    direction = 0;
}
if (keyboard_check(vk_left)) {
    horizontal_movement = -1;
    vertical_movement = 0;
    direction = 180;
}
if (keyboard_check(vk_up)) {
    vertical_movement = -1;
    horizontal_movement = 0;
    direction = 90;
}

if (keyboard_check(vk_down)) {
    vertical_movement = 1;
    horizontal_movement = 0;
    direction = 270;
}

move_and_collide(horizontal_movement * velocity, vertical_movement * velocity, Terrain)


image_angle = direction;
image_yscale = direction > 90 && direction < 270 ? -1 : 1;

move_wrap(true, false, 0);


		
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
	

