/// @description загрузка сохранения

//диалог в приоритете, если его нет, загружаемся 
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	//делаю вид, что кнопка ,,загрузить сохранение,, была нажата
	with (btn_ldSvId) {
		//искусственно выполняю ей событие нажатия
		btn_enable = true;
		event_perform(ev_mouse, ev_left_press);
	}
}