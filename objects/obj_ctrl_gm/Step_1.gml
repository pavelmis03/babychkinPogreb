/// @description пометка посещенных комнат

//добавление вновь посещенной после сохранения или начала игры комнаты
//в список обновленных комнат для дальнейшего сохранения
if (obj_ctrl_mv.ctrl_mv_change_rm) {
	var s = string_copy(room_get_name(room), 0, 6);
	if ((s == "rm_gm_") and (ds_list_find_index(ctrl_gm_changedRm, room) == -1)) {
		ds_list_add(ctrl_gm_changedRm, room);
		room_persistent = false;
		room_restart();
		//room_persistent = true;
		obj_ctrl_gm_sv.action = "loadRm";
	}
}




