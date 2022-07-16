/// @description 

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}

//определение фазы игры по комнатам
ctrl_gm_phase = scr_gm_phase();

