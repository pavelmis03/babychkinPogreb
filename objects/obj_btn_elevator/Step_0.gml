/// @description 

event_inherited();

//если был сигнал на деактивацию кнопок 
if (obj_ctrl_rmElevator.ctrl_elevator_disable_btn == 1) {
	//деактивируются все кнопки, кроме нажатой
	if (obj_ctrl_rmElevator.ctrl_elevator_id_btn_pressed != id) {
		btn_enable = false;
	}
}
//или на активацию
if (obj_ctrl_rmElevator.ctrl_elevator_disable_btn == 2) {
	btn_enable = true;
}