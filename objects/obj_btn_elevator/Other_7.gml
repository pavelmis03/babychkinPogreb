//после того, как кнопка проиграла спрайт, активирую заблокированные при нажатии на эту кнопку остальные кнопки
/*
if (!btn_enable) {
	//разблокируются кнопки по срабатывании той, которая вызвала блокировку
	if (obj_ctrl_rmElevator.ctrl_elevator_id_btn_pressed == id) {
		obj_ctrl_rmElevator.ctrl_elevator_disable_btn = 2;
	}
}
*/

image_index = image_number - 0.1 * image_speed;
image_speed = 0;

//если кнопка была нажата, совершаем действие
if (btn_pressed) {
	//если уже нажали на какую-либо кнопку, то ничего больше не делаем, кроме проигрывания спрайтов
	if (obj_ctrl_rmElevator.ctrl_elevator_id_btn_pressed == 0) {
		event_user(15);	
	}
	//btn_pressed = false; 
	//кнопка диспетчера не деактивирует другие кнопки
	if ((action != "scaryVoice") and (action != "none")) {
		//obj_ctrl_rmElevator.ctrl_elevator_disable_btn = 1;
		//ЕСЛИ ЭТО КНОПКА ЭТАЖА, ТО НАЗНАЧАЕМ ID НАЖАТОЙ КНОПКИ, ЧТОБЫ БОЛЬШЕ НЕ СРАБОТАЛО НАЖАТИЕ НА ДРУГИЕ
		obj_ctrl_rmElevator.ctrl_elevator_id_btn_pressed = id;
	}
}