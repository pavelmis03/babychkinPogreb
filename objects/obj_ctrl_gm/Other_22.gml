/// @description действия при выходе из игры в ГМ

//удаление контроллеров 
if (instance_exists(obj_ctrl_gm_img)) {
	instance_destroy(obj_ctrl_gm_img);
}

if (instance_exists(obj_ctrl_gm_pause)) {
	instance_destroy(obj_ctrl_gm_pause);
}
/*
if (instance_exists(obj_ctrl_inv)) {
	instance_destroy(obj_ctrl_inv);
}
*/
if (instance_exists(obj_ctrl_gm_playerInterface)) {
	instance_destroy(obj_ctrl_gm_playerInterface);
}

obj_ctrl_mv.action = "addRm";
room_goto(rm_menu_mm);
