if other.can_attack {
	hp = max(hp-other.damage, 0) ;
	other.can_attack = false;
}
