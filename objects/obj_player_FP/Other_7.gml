/// @description 
//самый простой способ отследить завершение атаки игрока
if (player_attack) { 
	player_attack = false;
	//уменьшаем жизни врагу
	if (player_col[?"enemy"] != 0) {
		player_col[?"enemy"].hp -= player_attackDamage;
	}
}