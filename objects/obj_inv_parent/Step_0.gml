/// @description

if (!init) {
	event_user(0);	
}

//провeрка нахождения игрока рядом
//if (player_obj.player_col[?type] == id) {
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
	if (distance_to_point(player_obj.x, player_obj.y) < 70) {
		//проверяю корректность направления взгляда игрока
		if (abs(angle_difference(player_obj.image_angle, point_direction(player_obj.x, player_obj.y, x, y))) <= 30) {
			//если персонаж взаимодействует с именно с нашим объектом (чтобы сразу два случайно не сработали)
			if ((player_obj.player_col[?type] == 0) or (player_obj.player_col[?type] == id)) {
				can_interact = true;
				//массив коллизий игрока
				player_obj.player_col[?type] = id;
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
