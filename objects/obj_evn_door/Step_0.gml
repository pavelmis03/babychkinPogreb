/// @description 

//проверка на то, что направление и расстояние совпадают
can_interact = false;
if (distance_to_point(player_obj.x, player_obj.y) < 70) {
	//проверяю корректность направления взгляда игрока
	if (abs(angle_difference(player_obj.image_angle, point_direction(player_obj.x, player_obj.y, x, y))) <= 30) {
		can_interact = true;
		//массив коллизий игрока
		player_obj.player_col[?type] = id;
		//добавление подсказки
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