/// @description 
//самый простой способ отследить завершение атаки игрока
if (player_attack) { 
	player_attack = false;
	//если есть контакт с врагом
	if (player_col[?"enemy"] != 0) {
		var obj_ind = asset_get_index(object_get_name(player_col[?"enemy"].object_index));
		//если игрок смотрит в сторону врага
		if (collision_line(x, y, x + lengthdir_x(1000, image_angle), y + lengthdir_y(1000, image_angle), obj_ind, true, true) != noone) {
			//наносим врагу урон
			player_col[?"enemy"].hp -= player_attackDamage;
		}
	}
}

if (player_pressE) {
	player_pressE = false;
	//если есть контакт с объектом инвентаря
	if (player_col[?"inv"] != 0) {
		var obj_ind = asset_get_index(object_get_name(player_col[?"inv"].object_index));
		//если игрок смотрит в сторону объекта инвентаря
		if (collision_line(x, y, x + lengthdir_x(1000, image_angle), y + lengthdir_y(1000, image_angle), obj_ind, true, true) != noone) {
			//сообщаем предмету, что перс. ,,смотрит,, на него
			player_col[?"inv"].inv_dirIsSatisfies = true;
		} else {
			player_col[?"inv"].inv_dirIsSatisfies = false;
		}
	}
}
