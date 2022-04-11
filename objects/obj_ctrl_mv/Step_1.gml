/// @description должен выполнять действие переходов раньше всех

//флаг смены комнаты актуален только один такт игры
if (ctrl_mv_change_rm) {
	ctrl_mv_change_rm = false;
}

//проверка на переход в другую комнату
if (pre_rm != room) {
	pre_rm = room;
	//произошла смена комнаты
	ctrl_mv_change_rm = true;
	//добавляем комнату в список
	//action = "addRm";
}

//выполнение действия
if (ds_list_size(action) != 0) {
	event_user(15);
	ds_list_delete(action, 0);
}
