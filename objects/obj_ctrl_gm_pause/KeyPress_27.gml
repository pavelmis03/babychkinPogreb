/// @description переход в паузу

if (room == rm_menu_pause) {
	//если есть диалог, сначала escapе удаляет его
	if (!obj_ctrl_dlg.ctrl_dlg_exist) {
		//если мы уже в паузе, возвращаемся
		obj_ctrl_mv.action = "goToRmPre";
		/* объяснение см. в Clean up
		isPause = false;
		*/
	}
} else {
	//из паузы можно попасть только в эти меню, чтобы ее оттуда нельзя было вызвать
	//if (scr_arr_fingEl([rm_menu_newGm_start, rm_menu_ldGm, rm_menu_settings, rm_menu_reference, rm_menu_journal, rm_menu_history, rm_pixel, rm_menu_lvlEnd, rm_menu_deathFP, rm_menu_deathSP], room, 1) == -1) {
	if (obj_ctrl_gm.ctrl_gm_phase == 1) {	//если мы в игре
		//room_goto(rm_menu_pause);
		
		ds_list_add(obj_ctrl_mv.next_rm, rm_menu_pause);//говорим, куда мы направимся 
		obj_ctrl_mv.ctrl_mv_rmChangeDelay = 0.1;		//даем время на сохранение
		obj_ctrl_gm_sv.action = "saveRoom";				//сохраняем комнату
		
		/* объяснение см. в Clean up
		//если комната была непостоянна до паузы, мы ее запоминаем, чтобы при случае вернуть ей постоянность
		if (room_persistent == 0) {
			ds_list_add(ctrl_pause_rmEscapeId, room);
		}
		room_persistent = 1;
		isPause = true;		//включаем индикатор паузы, чтобы сработало 
		*/
		//action = "goToPause";
	}
}

