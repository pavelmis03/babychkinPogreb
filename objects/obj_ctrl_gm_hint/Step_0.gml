/// @description 

//если часть игры не совпадает с содержанием массива подсказок, обновляю последний
if (((obj_ctrl_gm.ctrl_gm_stage == 1) and (ctrl_hint_map_hint[?"gmPart"] == "2")) or 
	((obj_ctrl_gm.ctrl_gm_stage == 2) and (ctrl_hint_map_hint[?"gmPart"] == "1"))) {
	event_user(10);
}

//обработка подсказки
if (ctrl_hint_newHint != "") {
	action = "set_hint";
}

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}



