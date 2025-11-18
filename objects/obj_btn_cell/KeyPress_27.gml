/// @description возвращаем ячейку на место

if (obj_ctrl_gm_rmInv.cellId == id) {
	obj_ctrl_gm_rmInv.cellId = -1;
	event_user(3);	// получение данных о предмете
}
