/// @description сохранение игры

//создаем новую папку для нового сохранения: saves/game_n/date_time/
//название новой папки сохранения
var new_path = scr_sv_dtDirName();
//создаем папку сохранения
directory_create(new_path);
ctrl_sv_svDir = new_path;

//если это не первый запуск данной игры, если папка загрузки текущего сохранения сущетвует
//копируем файлы из папки последнего сохранения в новую папку
if (/*(ctrl_sv_ldDir != "newGm") and*/ (directory_exists(ctrl_sv_gmDir + ctrl_sv_ldDir))) {
	
	//начинаем поиск в папке загрузки
	var fname = file_find_first(ctrl_sv_gmDir + ctrl_sv_ldDir + "*.*", 0);
		
	//проходим по всем файлам и копируем их в новую папку
	while (fname != "") {
		file_copy(fname, ctrl_sv_gmDir + new_path + fname);
		fname = file_find_next();
	}
		
	file_find_close();
}

//сохраняем информацию о том, что было произведено сохранение
//нужно для контроллера игры, который удаляет папку сохранений игры при выходе в ММ, если не было ни одного сохранения
//также добавляется информация о дате очередного сохранения
ini_open(ctrl_sv_gmDir + "save_cmn.ini");
ini_write_real("SAVES", "save_number", ini_read_real("SAVES", "save_number", 0) + 1);
ini_write_real("SAVES_INFO", new_path, date_datetime_string(date_current_datetime()) + "__" /*+ игровые дата и время, название квеста, локация*/); 
ini_close();

//теперь источник файлов для будущего сохранения вновь созданная папка
ctrl_sv_ldDir = new_path;

//создание скриншота для меню загрузки
obj_ctrl_gm_img.action = "createLdScreenShot";

//если это первое в игре сохранение, шаг с копированием просто пропускаем
//начинаем сохранение
//сначала идем в комнату пикселей - типа загрузка
ctrl_sv_saving = 1;
obj_ctrl_mv.action = "addRm";
ds_list_add(obj_ctrl_mv.next_rm, room); //добавляем текущую комнату в массив перемещений, 
										//чтобы вернуться в нее после комнаты пикселей (на нее будет ориентироваться контроллер пикселей)
obj_ctrl_gm.ctrl_gm_pixel_time = 3;		//время пребывания в комнате пикселей 
room_goto(rm_pixel);

