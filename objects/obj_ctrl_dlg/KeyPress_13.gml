/// @description вместо нажатия кнопки ,,да,,

//если диалог существует, выполняем действие, назначенное на кнопку yes
if (ctrl_dlg_exist) {
	//для кнопки cansel 
	with (ctrl_dlg_arr_btn[0]) {
		//искусственно выполняю ей событие нажатия
		btn_enable = true;
		event_perform(ev_mouse, ev_left_press);
	}
}