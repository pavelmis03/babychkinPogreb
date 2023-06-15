/// @description

var px = player_obj.x, py = player_obj.y;

if (!init) {
	event_user(0);	
}

//провeрка нахождения игрока рядом
//if (player_obj.player_map_col[?type] == id) {
//	inv_nearPlayer = true;	
//} else {
//	inv_nearPlayer = false;	
//}


//проверка возможности будущего взаимодейтсвия с предметом
if (inv_hp == 0 or inv_cnt == 0) {
	if (inv_cnt == 0) {
		//если есть спрайт пустой коробки/предмета
		sprite_index = inv_empty_spr;
		image_speed = 1;
	}
	//если предмет необходимо удалить при невозможности взаимодействовать
	if (inv_hp == 0 and inv_isRmv) {
		//назначаю спрайт разрушения. после его завершения, предмет будет удален
		sprite_index = inv_death_spr;
		image_speed = 1;
	}
	
	inv_canLoot = false;	
}

//можно ли в принципе использовать предмет
if (inv_canLoot) {
	//проверка на то, что направление и расстояние совпадают
	can_interact = false;
	//if (distance_to_point(player_obj.x, player_obj.y) < 70) {
	//проверяю, что игрок смотрит именно на объект инвентаря (рисую линию коллизии от игрока прямо на 60 пх)
	if (collision_line(px, py, px + lengthdir_x(60, player_obj.image_angle), py + lengthdir_y(60, player_obj.image_angle), id, true, false)) {	
		//проверяю корректность направления взгляда игрока
		if (abs(angle_difference(player_obj.image_angle, point_direction(px, py, x, y))) <= 30) {
			//если персонаж взаимодействует с именно с нашим объектом (чтобы сразу два случайно не сработали)
			if ((player_obj.player_map_col[?type] == 0) or (player_obj.player_map_col[?type] == id)) {
				can_interact = true;
				//массив коллизий игрока
				player_obj.player_map_col[?type] = id;
				//добавление подсказки
				obj_ctrl_gm_hint.ctrl_hint_newHint = hint;
			}		
		}
	}
}

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}
