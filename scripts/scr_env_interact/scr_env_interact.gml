/// @function scr_env_canInteract([additional_var], [additional_value]);
/// @param {} additional_var массив переменных, которые нужно проверить на соответствие массиву значений
/// @param {} additional_value двумерный массив удовлетворяющих значений переменных
		//где addVal[0] - массив допустимых значений для переменной addVar[0]
/// @description проверяет может ли персонаж взаимодействовать с предметом окружения, если да, то
	///привязывает свой id к словарю взаимодействий персонажа
function scr_env_canInteract(addVar, addVal) {
	if (distance_to_point(player_obj.x, player_obj.y) < 70) {
		//проверяю корректность направления взгляда игрока
		if (abs(angle_difference(player_obj.image_angle, point_direction(player_obj.x, player_obj.y, x, y))) <= 30) {
			//дополнительный набор условий (для отнаследованных от obj_env_parent объектов)
			//addVall - двумерный массив, т.е. addVal[0] - одномерный 
			//аналогично addVar[0] in addVal[0], где addVal - набор допустимых значений для переменной addVar[0]
			if (scr_arr_fingEl(addVal[0], addVar[0], 1) != -1) {
				//если персонаж взаимодействует с именно с нашим объектом (чтобы сразу два случайно не сработали)
				if ((player_obj.player_map_col[?type] == 0) or (player_obj.player_map_col[?type] == id)) {
					//массив коллизий игрока
					player_obj.player_map_col[?type] = id;
					//если дверь сейчас не находится в процессе открытия/закрытия
					if (!interacting) {
						can_interact = true;
						event_user(10);
					}
				}
			}
		}
	}
}