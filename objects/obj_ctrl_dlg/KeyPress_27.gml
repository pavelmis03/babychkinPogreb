/// @description удаляет диалог, работает, как cansel


//ctrl_dlg_del = true;

//если диалог существует, выполняем действие, назначенное на кнопку cansel
if (ctrl_dlg_exist) {
	//для кнопки cansel 
	with (ctrl_dlg_arr_btn[1]) {
		//искусственно выполняю ей событие нажа
		btn_enable = true;
		event_perform(ev_mouse, ev_left_press);
	}
}