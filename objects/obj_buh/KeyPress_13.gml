/// @description дебаг

//если спрайт завершился после того, как было начато взаимодействие

	//если персонаж взаимодействует с нашим объектом
	if ((player_obj.player_map_col[?type] == 0) or (player_obj.player_map_col[?type] == id)) {
		//сообщаю персонажу, что действие закончено
		player_obj.player_pressE = false;
	}
	
	interacting = false;
	
	//в зависимости от предмета: либо возвращается статический спрайт, либо другой
