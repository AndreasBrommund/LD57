image_angle = direction


if direction > 90 && direction < 270 {
	image_yscale = -1;
} else {
	image_yscale = 1;
}

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

if can_attack && distance_to_object(player) < fieldOfView {
	path_end();
	move_towards_point(player.x, player.y, attack_speed);
} else if(path_index == -1) {
	path_start(path, velocity, path_action_continue, false);
}