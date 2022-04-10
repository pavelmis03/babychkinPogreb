/// @description 

var player = scr_player_type();

if (enemy_attack) {
	//после завершения атаки возвращаем переменные к исходным значениям 
	enemy_attack = false;
	sprite_index = enemy_spr_go;
	image_index = 0;
	speed = enemy_spd;
	//по спрайту красивее, если урон игроку будет наноситься в конце анимации 
	player.hp -= enemy_damage[0];
}
