var r = random(10);
if r > 5 {
	velocity = -velocity;
} 

path_start(path, velocity, path_action_continue, false)