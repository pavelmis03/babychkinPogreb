/// @function scr_env_canInteract([additional_var], [additional_value]);
/// @param {} additional_var массив переменных, которые нужно проверить на соответствие массиву значений
/// @param {} additional_value двумерный массив удовлетворяющих значений переменных
		//где addVal[0] - массив допустимых значений для переменной addVar[0]
/// @description проверяет может ли персонаж взаимодействовать с предметом окружения, если да, то
	///привязывает свой id к словарю взаимодействий персонажа
function scr_env_canInteract(addVar, addVal) {
	var px = player_obj.x, py = player_obj.y;
	
	if (!player_obj.player_buhIn) {	//если игрок не в буханке
		//if (distance_to_point(player_obj.x, player_obj.y) < 70) {
		//проверяю, что игрок смотрит именно на объект инвентаря (рисую линию коллизии от игрока прямо на 60 пх)
		if (collision_line(px, py, px + lengthdir_x(60, player_obj.image_angle), py + lengthdir_y(60, player_obj.image_angle), id, false, false)) {	
			//проверяю корректность направления взгляда игрока
			if (abs(angle_difference(player_obj.image_angle, point_direction(px, py, x, y))) <= 30) {
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
}

/// @function scr_env_stopInteract();
/// @description оканчивает взаимодействие персонажа с предметом окружения
	//обычно в anim end
function scr_env_stopInteract() {
	//если спрайт завершился после того, как было начато взаимодействие
	if (interacting) {
		//если персонаж взаимодействует с нашим объектом
		if ((player_obj.player_map_col[?type] == 0) or (player_obj.player_map_col[?type] == id)) {
			//сообщаю персонажу, что действие закончено
			player_obj.player_pressE = false;
		}
		interacting = false;
	}
}