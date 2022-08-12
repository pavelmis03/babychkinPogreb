//после того, как кнопка проиграла спрайт, активирую заблокированные при нажатии на эту кнопку остальные кнопки
if (!btn_enable) {
	//разблокируются кнопки по срабатывании той, которая вызвала блокировку
	if (obj_ctrl_rmElevator.ctrl_elevator_id_btn_pressed == id) {
		obj_ctrl_rmElevator.ctrl_elevator_disable_btn = 2;
	}
}

event_inherited();