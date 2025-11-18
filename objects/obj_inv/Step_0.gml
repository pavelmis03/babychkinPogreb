/// @description

var px = player_obj.x, py = player_obj.y;
player_obj = scr_player_type();

if (!init) {
	event_user(0);	
}

// проверка возможности будущего взаимодейтсвия с предметом
if ((inv_hp == 0) or (inv_cnt == 0)) {
	// если закончились предметы и еще не назначен спрайт пустой
	if ((inv_cnt == 0) and (sprite_index != inv_empty_spr)) {
		sprite_index = inv_empty_spr;
		image_index = 0;
		image_speed = 1;
	} 
	if ((inv_hp == 0) and (sprite_index != inv_death_spr)) {
		// назначаю спрайт разрушения. после его завершения, предмет будет удален
		sprite_index = inv_death_spr;
		image_index = 0;
		image_speed = 1;// если предмет необходимо удалить при невозможности взаимодействовать
	}
		
	inv_canLoot = false;	
}

// можно ли в принципе использовать предмет
if (inv_canLoot) {
	// проверка на то, что направление и расстояние совпадают
	can_interact = false;
	if (player_obj.player_map_col[?type] == id) {	
		// массив коллизий игрока
		player_obj.player_map_col[?type] = 0;
	}
	// если игрок не атакует и т.д., если свободен, короче
	if ((!player_obj.player_attack) and (!player_obj.player_pressE) and (!player_obj.player_openInv)) {	
		// проверяю, что игрок смотрит именно на объект инвентаря (рисую линию коллизии от игрока прямо на 60 пх)
		if (collision_line(px, py, px + lengthdir_x(60, player_obj.image_angle), py + lengthdir_y(60, player_obj.image_angle), id, true, false)) {	
			// проверяю корректность направления взгляда игрока
			if (abs(angle_difference(player_obj.image_angle, point_direction(px, py, x, y))) <= 60) {
				// если персонаж взаимодействует с именно с нашим объектом (чтобы сразу два случайно не сработали)
				if ((player_obj.player_map_col[?type] == 0) or (player_obj.player_map_col[?type] == id)) {
					can_interact = true;
					// массив коллизий игрока
					player_obj.player_map_col[?type] = id;
					// добавление подсказки
					obj_ctrl_gm_hint.ctrl_hint_newHint = hint;
				}		
			}
		}
	}
}

// выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}
