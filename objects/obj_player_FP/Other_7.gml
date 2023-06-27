/// @description 
//самый простой способ отследить завершение атаки игрока
if (player_attack) { 
	player_attack = false;
	//если есть контакт с врагом
	if (player_map_col[?"enemy"] != 0) {
		var obj_ind = asset_get_index(object_get_name(player_map_col[?"enemy"].object_index));
		//если игрок смотрит в сторону врага
		if (collision_line(x, y, x + lengthdir_x(1000, image_angle), y + lengthdir_y(1000, image_angle), obj_ind, true, true) != noone) {
			//наносим врагу урон
			player_map_col[?"enemy"].hp -= player_attackDamage;
		}
	}
}

/*
if (player_pressE) {
	player_pressE = false;
}
*/

//если спрайт использования предмета закончился, то перс. просто стоит
if (sprite_index == spr_playerFP_use) {
	sprite_index = spr_playerFP_state;
}
if (sprite_index == spr_playerFP_kick) {
	sprite_index = spr_playerFP_state;
}