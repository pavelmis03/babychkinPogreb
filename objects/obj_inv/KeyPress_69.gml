/// @description проверяется нажатие кнопки взаимодействия игроком

player_obj = scr_player_type();	// какой игрок в комнате сейчас

if (can_interact) {
	// массив коллизий игрока
	if (player_obj.player_map_col[?type] == id) {	// если взаимодействуют именно с нами
		obj_ctrl_gm_inv.action = "add_item";	// действие взятия предметов
		obj_ctrl_gm_inv.inv_itemId = id;		// говорим, кого именно подбирать
		interacting = true;
		image_speed = 1;
	}
}

