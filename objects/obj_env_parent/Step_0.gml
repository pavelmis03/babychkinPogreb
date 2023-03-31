/// @description 

player_obj = scr_player_type();	//какой игрок в комнате на момент создания

//проверка на то, что направление и расстояние совпадают
can_interact = false;
//освобождаем персонажа от коллизии
if (player_obj.player_map_col[?type] == id) {	
	//массив коллизий игрока
	player_obj.player_map_col[?type] = 0;
}

//ВМЕСТО ЭТОГО ТЕПЕРЬ СКРИПТ:
//scr_env_canInteract() КОТОРЫЙ ВЫЗЫВАЕТСЯ ИЗ КАЖДОГО РЕБЕНКА ОТДЕЛЬНО СО СВОИМИ УСЛОВИЯМИ
//if (distance_to_point(player_obj.x, player_obj.y) < 70) {
//	//проверяю корректность направления взгляда игрока
//	if (abs(angle_difference(player_obj.image_angle, point_direction(player_obj.x, player_obj.y, x, y))) <= 30) {
//		//если персонаж взаимодействует с именно с нашим объектом (чтобы сразу два случайно не сработали)
//		if ((player_obj.player_map_col[?type] == 0) or (player_obj.player_map_col[?type] == id)) {
//			//массив коллизий игрока
//			player_obj.player_map_col[?type] = id;
//			//если дверь сейчас не находится в процессе открытия/закрытия
//			if (!interacting) {
//				can_interact = true;
//				event_user(10);
//			}
//		}
//	}
//}


//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}

//инициализация
if (!init) {
	event_user(0);	
}