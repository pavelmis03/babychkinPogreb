/// @description 

player_obj = scr_player_type();

//инициализация 
if (!init) {
	event_user(0);
}

if (hp <= 0) {
	event_user(1);	//событие смерти	
}
