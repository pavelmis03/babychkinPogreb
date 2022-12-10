/// @description таймер перехода по комнатам и сохранения

//переходим по комнатам, пока не закончатся комнаты для сохранения
if (ds_list_size(obj_ctrl_gm.ctrl_gm_changedRm) != 0) {
	//переходим в комнату из сохраненных
	obj_ctrl_mv.action = "addRm";
	//ds_list_add(obj_ctrl_mv.next_rm, obj_ctrl_gm.ctrl_gm_changedRm[|0]); 
	room_goto(obj_ctrl_gm.ctrl_gm_changedRm[|0]);	//new
	alarm[0] = 5;
}
