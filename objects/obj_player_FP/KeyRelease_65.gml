//удаляю отпущенную клавишу в список нажатых клавишь, чтобы потом определить движение по последним нажатым клавишам
ds_list_delete(player_move_key_list, ds_list_find_index(player_move_key_list, "A"));