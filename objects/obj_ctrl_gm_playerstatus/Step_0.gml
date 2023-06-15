/// @description 

//объект игрока
player_obj = scr_player_type();

if (!init) {
	event_user(0);
}

//проверка на переход в другую комнату
if (obj_ctrl_mv.pre_rm != room) {
	//проверяем, что о нашей комнате есть информация (только для игровых)
	if (ds_map_exists(global.CONST_MAP_RM_INFO, room)) {
		action = "changeRm";
	}
}

//сохраняем информацию об игроке в данной комнате, если мы уже давно в этой комнате (чтобы, если мы только перешли в нее
//данные об игроке успели загрузиться в UE15 из player_map_info до того, как перезапишутся. 
//Или, если мы в этой комнате первый раз, создаем ключ со значением по умолчанию
if ((player_obj != -1) and ((obj_ctrl_mv.pre_rm == room) or (!ds_map_exists(player_map_info, room)))) {
	player_map_info[?room] = [player_obj.x, player_obj.y, player_obj.depth];
}


//изменение параметров состояний
event_user(10);

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}


