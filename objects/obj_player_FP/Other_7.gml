/// @description 
// самый простой способ отследить завершение атаки игрока
if (player_attack) { 
	player_attack = false;
	// если есть контакт с врагом
	if (player_map_col[?"enemy"] != 0) {
		var obj_ind = asset_get_index(object_get_name(player_map_col[?"enemy"].object_index));
		// если игрок смотрит в сторону врага
		if (collision_line(x, y, x + lengthdir_x(1000, image_angle), y + lengthdir_y(1000, image_angle), obj_ind, true, true) != noone) {
			// наносим врагу урон
			player_map_col[?"enemy"].hp -= player_attackDmg;
		}
	}
}

/*
if (player_pressE) {
	player_pressE = false;
}
*/

// если спрайт использования предмета закончился, то перс. просто стоит
if (sprite_index == spr_playerFP_use) {
	sprite_index = spr_playerFP_state;
}
if (sprite_index == spr_playerFP_kick) {
	sprite_index = spr_playerFP_state;
}
// если мы открывали инвентарь проверить
// if (sprite_index == spr_playerFP_openInv) {
if (player_openInv) {
	if (image_speed != -1) {	// если сейчас снимали рюкзак
		obj_ctrl_gm_inv.action = "goToInv"; // то сообщаем контроллеру инвентаря, что надо открыть комнату инвентаря
		// image_speed = -1;	// и готовимся проиграть спрайт в обратную сторону (не нужно, потому что игрок непостоянный и это не сохранится)
		// image_index = image_number - 0.1;
		// sprite_index = spr_playerFP_openInv;
	} else {
		image_speed = 1;	// если мы проиграли спрайт надевания рюкзака, то просто стоим
							// после выхода из инвентаря контроллер инвентаря назначит нужный спрайт игроку
		sprite_index = spr_playerFP_state;	
		player_openInv = false;	// на этом работа с инвентарем закончена
	}
}