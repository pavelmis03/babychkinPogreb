/// @description переход в паузу

if (room == rm_menu_pause) {
	//если есть диалог, сначала escapе удаляет его
	if (!obj_ctrl_dlg.ctrl_dlg_exist) {
		//если мы уже в паузе, возвращаемся
		obj_ctrl_mv.action = "goToRmPre";
	}
} else {
	//из паузы можно попасть только в эти меню, чтобы ее оттуда нельзя было вызвать
	if (scr_arr_fingEl([rm_menu_newGm_start, rm_menu_ldGm, rm_menu_settings, rm_menu_journal, rm_menu_history, rm_pixel, rm_menu_lvlEnd, rm_menu_deathFP, rm_menu_deathSP], room, 1) == -1) {
		//создаем копию нашей комнаты, чтобы сохранить состояние экземпляров
		room_goto(rm_menu_pause);
		room_persistent = 1;
		
		obj_ctrl_mv.action = "addRm";
		//action = "goToPause";
	}
}

