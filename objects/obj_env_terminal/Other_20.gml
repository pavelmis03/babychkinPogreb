/// @description действия, которые надо выполнять, когда персонаж подошел и смотри в нужном направлении

//добавление подсказки 
//если терминал перезагружается, то мы никакой подсказки игроку не даем, иначе выбираем из трех
obj_ctrl_gm_hint.ctrl_hint_newHint = "terminal_canSave";

if (terminal_saves == 0) {
	obj_ctrl_gm_hint.ctrl_hint_newHint = "terminal_empty";
}

if (hp <= 0) {
	obj_ctrl_gm_hint.ctrl_hint_newHint = "terminal_destr";
}

if (terminal_state != "reload") {
	obj_ctrl_gm_hint.action = "cleareHint";
}


