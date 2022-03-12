/// @description 

//если кто-либо подал запрос на создание диалога
if (ctrl_dlg_need) {
	event_user(15);
	ctrl_dlg_exist = true;	//показываем всем, что диалог создан
	ctrl_dlg_need = false;
}

//если кто-то подал запрос на закрытие диалога
if (ctrl_dlg_del) {		
	sprite_index = spr_sys_none;
	draw_txt = "";
	//удаление кнопок диалога
	for (var i = 0; i < array_length(ctrl_dlg_arr_btn); i++) {
		instance_destroy(ctrl_dlg_arr_btn[i]);	//удаляю кнопку
	}
	array_delete(ctrl_dlg_arr_btn, 0, array_length(ctrl_dlg_arr_btn));	//очищаю массив
	ctrl_dlg_exist = false;
	ctrl_dlg_del = false;
}
