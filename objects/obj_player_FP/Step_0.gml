//игрок всегда смотрит на курсор, кроме атаки
//во время удара и взаимодействия с предметом персонаж не может перемещаться
//pressE нужно для случая, когда спрайт заканчивается раньше, чем предмет заканчивает действие
//спрайт для противоположной ситуации, также спрайт пинания буханки
if (!player_attack and !player_pressE and scr_arr_fingEl([spr_playerFP_use, spr_playerFP_kick], sprite_index, 1) == -1) {
	image_angle = point_direction(x, y, mouse_x, mouse_y);
	//тип движения 
	scr_player_moveType();
}

//очистка массива коллизий от id тех, с кем их больше нет
var key = ds_map_find_first(player_map_col);
for (var i = 0; i < ds_map_size(player_map_col); i++) {
	//если ячейка вообще заполнена
	if (player_map_col[?key] != 0) {
		//если перс уже не имеет коллизии с указанным экземп, то удаляю его id
		if (instance_place(x, y, player_map_col[?key]) == noone) { 
			player_map_col[?key] = 0;
		}
	}
	key = ds_map_find_next(player_map_col, key);
}

//проверка на смерь персонажа
if (obj_ctrl_gm_playerStatus.hp <= 0 and !player_isDeath) {
	obj_ctrl_gm.action = "player_death_FP";
	player_isDeath = true;
	obj_ctrl_gm_playerStatus.hp = 0;
}

