/// @description 

//проверка на то, что направление и расстояние совпадают
can_interact = false;
//освобождаем персонажа от коллизии
if (player_obj.player_col[?type] == id) {	
	//массив коллизий игрока
	player_obj.player_col[?type] = 0;
}

if (distance_to_point(player_obj.x, player_obj.y) < 70) {
	//проверяю корректность направления взгляда игрока
	if (abs(angle_difference(player_obj.image_angle, point_direction(player_obj.x, player_obj.y, x, y))) <= 30) {
		//если дверь сейчас не находится в процессе открытия/закрытия (спрайт уже проигрался и статичен)
		if (image_speed == 0) {
			//если персонаж взаимодействует с именно с нашим объектом (чтобы сразу два случайно не сработали)
			if ((player_obj.player_col[?type] == 0) or (player_obj.player_col[?type] == id)) {
				can_interact = true;
				//массив коллизий игрока
				player_obj.player_col[?type] = id;
				//добавление подсказки (если дверь открыта, подсказка на закрытие и наоборот)
				if (destination == "pre_room") {
					obj_ctrl_gm_hint.ctrl_hint_newHint = "closeDoor";
				} else {
					obj_ctrl_gm_hint.ctrl_hint_newHint = "openDoor";
				}
			}
		}
	}
}


//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}

//инициализация
if (!init) {
	event_user(0);	
}