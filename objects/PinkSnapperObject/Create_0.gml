velocity = random_range(4,6)
var r = random(10);
if r > 5 {
	velocity = -velocity;
} 

x = random_range(sprite_height, room_height-sprite_height);
y = random_range(sprite_width, room_width-sprite_width);
path_start(path, velocity, path_action_continue, false)

