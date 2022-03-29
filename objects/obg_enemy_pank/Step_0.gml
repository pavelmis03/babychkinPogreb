/// @description 

event_inherited();

var player = scr_player_type();

//если до игрока далеко, то панк убегает, иначе атакует
if (distance_to_object(player) >= enemy_seeDist) {
	enemy_wander = true;
	enemy_needAttack = false;
} else {
	enemy_wander = false;
	//если игрок появился слишком близко, панк его атакует
	enemy_needAttack = true;
}

//если игрока пора атаковать, панк бежит к нему
if (enemy_needAttack and !enemy_attack) {
	scr_enemy_moveToPlayer();
}