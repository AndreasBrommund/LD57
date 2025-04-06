event_inherited();

if can_attack {
	var ps = part_system_create(JellyfishSparkParticleSystem);	
	var ps_x = x+sprite_width/2;
	var ps_y = y+sprite_height-10;
	
	part_system_position(ps, ps_x, ps_y);
}