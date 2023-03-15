/// @description 

//выполнение действия
/*
if (action != "") {
	event_user(15);
	action = "";
}
*/
/* объяснение см. в Clean up
//действия после паузы
if (!isPause) {
	//если в массиве комнат, которым мы поломали непостоянность нашлась текущая, меняем ее постоянность
	var ind = ds_list_find_index(ctrl_pause_rmEscapeId, room);
	if (ind != -1) {
		room_persistent = 0;
		//удаляю комнату из испорченных
		ds_list_delete(ctrl_pause_rmEscapeId, ind);
	}
}
*/