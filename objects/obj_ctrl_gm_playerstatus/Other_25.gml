/// @description действия 

switch (action) {
	//действия при смене комнаты
	case "changeRm":	//создаем игрока в новой комнате
		//["Офис Леонида", obj_player_FP, ...] 
		//проверка на существование ключей в степ: при отсутствии ключа CONST_MAP_RM_INFO не будет назначен action
		//если нет ключа player_map_info, в степ он будет создан по умолчанию до UE15
		var arr = global.CONST_MAP_RM_INFO[?room];			//получаем массив инфы о комнате
		if (scr_arr_fingEl(player_arr, arr[1], 1) != -1) {	//проверяем, что в этой комнате должен быть игрок
		//игрок создается в каждой комнате (так просто удобнее)
		//	if (!instance_exists(arr[1])) {				//проверяем, что игрока нет
		//		var t = player_map_info[?room];				//информация об игроке
		//		instance_create_depth(t[0], t[1], t[2], arr[1]);	//создаем игрока
		//	} else {
				var t = player_map_info[?room];				//информация об игроке
				arr[1].x = t[0];	//переносим игрока в сохраненные координаты
				arr[1].y = t[1];
				arr[1].depth = t[2];
		//	}
		}
	break;
}
