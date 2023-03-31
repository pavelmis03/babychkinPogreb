/// @description выполнение действия

//здесь нужен скрипт проверки возможности нажатия
if ((!player_pressE) and (!player_attack)) {
	//если мы можем с кем-то взаимодействовать
	if (player_map_col[?"mapObj"] != 0 or player_map_col[?"inv"] != 0) {
		player_pressE = true;
		sprite_index = spr_playerFP_use;
		speed = 0;
		image_index = 0;
		image_speed = 1;
	}
}

