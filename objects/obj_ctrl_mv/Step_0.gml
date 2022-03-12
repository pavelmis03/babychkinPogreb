/// @description 

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
if (action != "") {
	event_user(15);
	action = "";
}