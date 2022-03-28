//добавляю нажатую клавишу в список нажатых клавишь, чтобы потом определить движение по последним нажатым клавишам
if (ds_list_find_index(player_move_key_list, "A") == -1) {
	ds_list_add(player_move_key_list, "A");
}