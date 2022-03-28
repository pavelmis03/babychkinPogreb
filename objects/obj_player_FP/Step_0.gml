//игрок всегда смотрит на курсор, кроме атаки
//во время удара персонаж не может перемещаться
if (!player_attack) {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	//тип движения 
	scr_player_moveType();
}

//проверка на коллизии с экземплярами, занесенными в словарь коллизий
var key = ds_map_find_first(player_col);
for (var i = 0; i < ds_map_size(player_col); i++) {
	//если ячейка вообще заполнена
	if (player_col[?key] != 0) {
		//если перс уже не имеет коллизии с указанным экземп, то удаляю его id
		if (instance_place(player_col[?key].x, player_col[?key].y, player_col[?key])) { 
			player_col[?key] = 0;
		}
	}
	key = ds_map_find_next(player_col, key);
}