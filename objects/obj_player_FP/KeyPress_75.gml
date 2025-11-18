/// @description пинание буханки
if (instance_exists(obj_buh)) {
	if ((!player_attack) and (!player_pressE) and (!player_openInv)) {
		// если мы можем с ней взаимодействовать
		if (player_map_col[?"mapObj"] == obj_buh.id) {
			if (sprite_index != spr_playerFP_kick) {
				sprite_index = spr_playerFP_kick;
				speed = 0;
				image_index = 0;
				image_speed = 1;
			}
		}
	}
}
