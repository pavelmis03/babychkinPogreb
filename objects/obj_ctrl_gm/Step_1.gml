/// @description пометка посещенных комнат
/*
//добавление вновь посещенной после сохранения или начала игры комнаты
//в список обновленных комнат для дальнейшего сохранения
if (obj_ctrl_mv.ctrl_mv_change_rm) {
	var s = string_copy(room_get_name(room), 0, 6);
	//обновляются только игровые комнаты, которые еще не были посещены
	if ((s == "rm_gm_") and (ds_list_find_index(ctrl_gm_changedRm, room) == -1)) {
		ds_list_add(ctrl_gm_changedRm, room);
		
		//теоритически нужно было для сброса настроек всех экземпляров.
		//необходимость отпала потому, что теперь все экземпляры удаляются перед восстановлением
		//room_persistent = false;
		//room_restart();
		
		//room_persistent = true;
		//если это первое посещение данной комнаты после загрузки игры, нужно изменить ее объекты так,
		//как они были изменены игроком за прошлую игру (восстановить сохраненное состояние). Если это сохранение есть
		//проверка в контроллере сохранений
		obj_ctrl_gm_sv.action = "loadRm";
	}
}




