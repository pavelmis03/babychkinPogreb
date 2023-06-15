/// @description 

var player = scr_player_type();

//инициализация 
if (!init) {
	event_user(0);
}

if (hp <= 0) {
	event_user(1);	//событие смерти	
}

//если до игрока далеко, то враг бродит, иначе атакует

/*
НЕ ИСПОЛЬЗОВАТЬ distance_to_object(см. заметки) или использовать coll line
if (distance_to_object(player) >= enemy_seeDist) {
	//запоминаем один раз, только при потере игрока из вида
	if (!enemy_wander) {
		enemy_wanderBaseX = x;
		enemy_wanderBaseX = y;
	}
	enemy_wander = true;
	enemy_needAttack = false;
} else {
	//если игрок был обнаружен, назначаем спрайт движения
	if ((enemy_wander) and (sprite_index != enemy_spr_go)) {
		sprite_index = enemy_spr_go;
		image_index = 0;	
	}
	enemy_wander = false;
	//если игрок появился слишком близко, враг его атакует
	enemy_needAttack = true;
}
*/
//если игрока пора атаковать, враг бежит к нему
if (enemy_needAttack and !enemy_attack) {
	scr_enemy_moveToPlayer();
}
