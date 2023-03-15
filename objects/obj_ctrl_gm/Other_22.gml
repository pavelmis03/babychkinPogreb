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
ini_open(obj_ctrl_gm_sv.ctrl_sv_gmDir + "/save_cmn.ini");	//файл общей инфы по сохранениям
//если не было сохранений
if (ini_read_real("SAVES", "save_number", 0) == 0) {
	directory_destroy(obj_ctrl_gm_sv.ctrl_sv_gmDir);	//удаляем всю папку игры
	//т.к. мы не знаем, какая была последняя, поэтому ничего не записываем, в gameInfo.ini останется (если была) последняя папка игры
	/*
	ini_open("gameInfo.ini");
	ini_write_string("GAMEINFO", "lastGame", "0");		
	ini_close();
	*/
} else { //если были сохранения
	var lastSv = obj_ctrl_gm_sv.ctrl_sv_svDir;	//папка последнего сохранения
	
	//удаляем недействительное сохранение
	ini_open(obj_ctrl_gm_sv.ctrl_sv_svDir + "/saveInfo.ini");
	if (!ini_read_real("MAIN", "saveValid", 0)) {	//если текущее сохранение помечено как недействительное
		directory_destroy(lastSv);
		var num = scr_str_extractNums(lastSv); //номера сохранений
		num = num[array_length(num) - 1];	//номер последнего сохранения
		//вырезаем строку до номера сохранения и добавляем номер - 1 
		lastSv = string_copy(lastSv, 0, string_last_pos("_", lastSv)) + string(int64(num) - 1);
	}
	ini_close();
	
	//если были сохранения, то записываем текущую игру, как последнюю, 
	//чтобы потом автоматически подставить в меню загрузок
	ini_open("gameInfo.ini");
	//var str = obj_ctrl_gm_sv.ctrl_sv_gmDir;	//берем только номер игры для удобства
	//str = string_copy(str, string_last_pos("_", str) + 1, 1);
	//ini_write_string("GAMEINFO", "lastGame", str);
	ini_write_string("GAMEINFO", "lastGame", obj_ctrl_gm_sv.ctrl_sv_gmDir);
	ini_write_string("GAMEINFO", "lastSave", lastSv);
	ini_close();
}

ini_close();

//очищаю список сохраненных комнат (теперь он не нужен)
//ds_list_clear(ctrl_gm_changedRm);

obj_ctrl_mv.action = "addRm";
room_goto(rm_menu_mm);
