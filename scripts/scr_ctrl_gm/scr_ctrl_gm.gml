/// @function scr_gm_phase();
/// @description эта функция возвращает фазу игры, определяя ее по комнатам: 0 - menu, 1 - game, 2 - history&dialog
function scr_gm_phase() {
	var phase = -1;
	var name = room_get_name(room);
	
	if (string_copy(name, 0, 7) == "rm_menu" or room == rm_pixel) {
		phase = 0;
	}
	
	if (string_copy(name, 0, 5) == "rm_gm") {
		phase = 1;
	}
	
	if (room == rm_menu_history) {
		phase = 2;
	}
	
	return phase;
}

/// @function scr_gm_goToDlgRm();
/// @param {} rm комната, в которую нужно перейти после диалога
/// @param {} time время, через которое будет вызван диалог
/// @description настройки перед переходом в комнату диалогов
function scr_gm_goToDlgRm(rm, time) {
	cursor_sprite = -1;		//чтобы курсора не было на скрине
	obj_ctrl_gm_img.action = "createTempScreenShot"; //создаем скрин экрана
	alarm[1] = time;	//время на создание скрина
	//сохраняем комнату, куда нас отправит контроллер истории после просмотра истории
	ds_list_add(obj_ctrl_mv.next_rm_list_, rm); 
	ctrl_gm_histStatus = 2;	//говорим, что после пикселей надо идти в диалоги, а не в историю
	ctrl_gm_pixel_time = -1;		//время пребывания в комнате пикселей (-1 - не надо нам пиксели)
}

