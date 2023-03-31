/// @description 

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}

if (obj_ctrl_gm.ctrl_gm_phase == 1) {	//если мы в игре
	//перезагрузка несохраненных комнат
	if ((array_length(ctrl_sv_ldRms) == 0) or 
		(scr_arr_fingEl(ctrl_sv_ldRms, room_get_name(room), 1) == -1)) {
		//сохраняем постоянность комнаты, чтобы после перезагрузки вернуть все, как было
		ctrl_sv_isRmPers = room_persistent;
		room_persistent = false;
		room_restart();	
		//отмечаем комнату, в которой побывали
		array_push(ctrl_sv_ldRms, room_get_name(room));
	}
	
	//загрузка комнат
	if (array_length(ctrl_sv_ldRmsTmp) != 0) {
		//если эту комнату сохраняли, загружаем объекты в комнату
		var ind = scr_arr_fingEl(ctrl_sv_ldRmsTmp, room_get_name(room), 1);
		if (ind != -1) {
			action = "ldRm";
			//вновь загружаемую комнату тоже перезагружаем, чтобы вернуть в ней на место временные объекты 
			ctrl_sv_isRmPers = room_persistent;
			room_persistent = false;
			room_restart();	
			//удаляем комнату из массива комнат, которые надо загрузить
			array_delete(ctrl_sv_ldRmsTmp, ind, 1);
		}
	}
}

//возможно только если мы загрузились или начали новую игру только что
if (ctrl_sv_ldDir != ctrl_sv_svDir) {
	event_user(7);	//создание недействительной папки сохранений
}



















