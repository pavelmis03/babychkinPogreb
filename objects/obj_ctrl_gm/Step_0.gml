/// @description 

//добавление вновь посещенной после сохранения или начала игры комнаты
//в список обновленных комнат для дальнейшего сохранения
if (obj_ctrl_mv.ctrl_mv_change_rm) {
	var s = string_copy(room_get_name(room), 0, 6);
	if ((s == "rm_gm_") and (ds_list_find_index(ctrl_gm_changedRm, room) == -1)) {
		ds_list_add(ctrl_gm_changedRm, room);
		obj_ctrl_gm_sv.action = "loadRm";
	}
}

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}
/*
//определение фазы игры по комнатам
ctrl_gm_phase = scr_gm_phase();
*/
