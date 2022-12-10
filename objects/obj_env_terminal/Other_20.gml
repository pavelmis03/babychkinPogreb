/// @description действия, которые надо выполнять, когда персонаж подошел и смотри в нужном направлении

//добавление подсказки 
obj_ctrl_gm_hint.ctrl_hint_newHint = "terminal_canSave";

if (terminal_saves == 0) {
	obj_ctrl_gm_hint.ctrl_hint_newHint = "terminal_empty";
}

if (hp <= 0) {
	obj_ctrl_gm_hint.ctrl_hint_newHint = "terminal_destr";
}



