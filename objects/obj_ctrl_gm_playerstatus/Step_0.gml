/// @description 

//объект игрока
player = scr_player_type();

//проверка на переход в другую комнату
if (obj_ctrl_mv.ctrl_mv_change_rm) {
	action = "changeRm";
}

//изменение параметров состояний
event_user(10);

if (!init) {
	event_user(0);
}



