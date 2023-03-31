//добавляю нажатую клавишу в список нажатых клавишь, чтобы потом определить движение по последним нажатым клавишам
if (ds_list_find_index(player_list_move_key, "A") == -1) {
	ds_list_add(player_list_move_key, "A");
}