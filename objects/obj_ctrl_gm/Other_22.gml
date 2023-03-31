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

if (instance_exists(obj_ctrl_tml)) {
	instance_destroy(obj_ctrl_tml);
}
/*
//удаление папки сохранения игры, если игрок вышел в меню, не сделав ни одного сохранения
ini_open(obj_ctrl_gm_sv.ctrl_sv_gmDir + "/save_cmn.ini");	//файл общей инфы по сохранениям
//если не было сохранений
if (ini_read_real("SAVES", "save_number", 0) == 0) {
	directory_destroy(obj_ctrl_gm_sv.ctrl_sv_gmDir);	//удаляем всю папку игры
} else { //если были сохранения
	var lastSv = obj_ctrl_gm_sv.ctrl_sv_svDir;	//папка последнего сохранения
	
	//удаляем недействительное сохранение
	ini_open(obj_ctrl_gm_sv.ctrl_sv_svDir + "/saveInfo.ini");
	if (!ini_read_real("MAIN", "saveValid", 0)) {	//если текущее сохранение помечено как недействительное
		directory_destroy(lastSv);
	}
	ini_close();
	
}
ini_close();
*/
obj_ctrl_mv.action = "addRm";
obj_ctrl_gm_sv.action = "exitToMM";	//сообщаем контроллеру сохранений, чтобы очистил все, что надо 
obj_ctrl_snd.action = "sndCleare";	//чистим звуки игры
//obj_ctrl_tml.action = "exitToMM";	//сообщаем контроллеру таймлайнов, чтобы очистил все, что надо 
room_goto(rm_menu_mm);
