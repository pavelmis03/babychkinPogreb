/// @description 

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}

//действия после сохранения, когда понадобятся
if (ctrl_sv_saving == 3) {
	ctrl_sv_saving = 0;	
}

//если мы перешли в другую комнату в состоянии сохранения игры (ctrl_sv_saving == 2), то запускаем
//скрипт сохранения комнпты
if ((obj_ctrl_mv.ctrl_mv_change_rm) and (ctrl_sv_saving == 2)) {
	scr_sv_svRm(ctrl_sv_gmDir + ctrl_sv_svDir + room_get_name(room) + "_save.txt");
	//последняя комната (в которой было начато сохранение) не должна быть удалена, потому что
	//с нее продолжится игра, значит, она тоже будет изменена
	if (ds_list_size(obj_ctrl_gm.ctrl_gm_changedRm) != 1) {
		ds_list_delete(obj_ctrl_gm.ctrl_gm_changedRm, 0);
	} else {
		//если это была последняя комната, останавливаем сохранение
		ctrl_sv_saving = 3;
	}
}

//если мы сходили в комнату пикселей, можно начинать сохранение
if ((room != rm_pixel) and (ctrl_sv_saving == 1)) {
	alarm[0] = 1;
	ctrl_sv_saving = 2;
}
