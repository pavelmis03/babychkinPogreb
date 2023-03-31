//удаляю отпущенную клавишу в список нажатых клавишь, чтобы потом определить движение по последним нажатым клавишам
ds_list_delete(player_list_move_key, ds_list_find_index(player_list_move_key, "A"));