/// @description переход в паузу

if (room == rm_menu_pause) {
	//если есть диалог, сначала escapе удаляет его
	if (!obj_ctrl_dlg.ctrl_dlg_exist) {
		//если мы уже в паузе, возвращаемся
		obj_ctrl_mv.action = "goToRmPre";
	}
} else {
	if (obj_ctrl_gm.ctrl_gm_phase == 1) {	//если мы в игре
		ds_list_add(obj_ctrl_mv.next_rm_list_, rm_menu_pause);//говорим, куда мы направимся 
		obj_ctrl_mv.ctrl_mv_rmChangeDelay = 0.1;		//даем время на сохранение
		obj_ctrl_gm_sv.action = "svRm";				//сохраняем комнату
	}
}

