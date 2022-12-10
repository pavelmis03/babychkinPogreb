/// @description действия при выходе из игры в ГМ

//удаление контроллеров 
if (instance_exists(obj_ctrl_gm_img)) {
	instance_destroy(obj_ctrl_gm_img);
}

if (instance_exists(obj_ctrl_gm_pause)) {
	instance_destroy(obj_ctrl_gm_pause);
}

if (instance_exists(obj_ctrl_gm_inv)) {
	instance_destroy(obj_ctrl_gm_inv);
}

if (instance_exists(obj_ctrl_gm_playerInterface)) {
	instance_destroy(obj_ctrl_gm_playerInterface);
}
if (instance_exists(obj_ctrl_gm_playerStatus)) {
	instance_destroy(obj_ctrl_gm_playerStatus);
}

if (instance_exists(obj_ctrl_gm_hint)) {
	instance_destroy(obj_ctrl_gm_hint);
}

if (instance_exists(obj_ctrl_gm_iss)) {
	instance_destroy(obj_ctrl_gm_iss);
}

//удаление папки сохранения игры, если игрок вышел в меню, не сделав ни одного сохранения
ini_open(obj_ctrl_gm_sv.ctrl_sv_gmDir + "save_cmn.ini");	//файл общей инфы по сохранениям

if (ini_read_real("SAVES", "save_number", 0) == 0) {
	directory_destroy(obj_ctrl_gm_sv.ctrl_sv_gmDir);
}

ini_close();

//очищаю список сохраненных комнат (теперь он не нужен)
ds_list_clear(ctrl_gm_changedRm);

obj_ctrl_mv.action = "addRm";
room_goto(rm_menu_mm);
