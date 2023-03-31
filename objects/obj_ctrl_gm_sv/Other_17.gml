/// @description создание нового (недействительного) сохранения

//если это первая игра
if (ctrl_sv_ldDir == "newGm") {
	//создаем первое сохранение
	ctrl_sv_svDir = ctrl_sv_gmDir + "/save_1";
	ctrl_sv_ldDir = ctrl_sv_svDir;
	directory_create(ctrl_sv_svDir);
	
	//данные по текущему сохранению
	ini_open(ctrl_sv_svDir + "/saveInfo.ini");
	//действительность сохранения
	ini_write_real("MAIN", "saveValid", 0);
	ini_write_string("SAVE_INFO", "name", ctrl_sv_svDir);	//имя, которое потом сохранится в родителя
	ini_write_string("SAVE_INFO", "parent", "root");	//родитель
	ini_close();
} else {  //если мы загружаемся из какой-то папки уже существующего сохранения
	//создаем новое сохранение 	
	var str1 = scr_str_extractNums(scr_file_findLast(ctrl_sv_ldDir)); //находим последнюю папку в ветви и выделяем из строки n
	str1 = array_last(str1);	//n
 
	//для загрузки игры (если при загрузке мы к пути сохранения добавили ветку)
	//копирую последнее слово в пути загрузок без номера (7 - branch_) только для проверки на ветвь
	var t = string_copy(ctrl_sv_svDir, string_last_pos("/", ctrl_sv_svDir) + 1, 7);
	//создаю новую недействительную папку
	if (t == "branch_") {	//если при загрузке создана новая ветвь
		ctrl_sv_svDir += "/save_1";
	} else {
		//для сохранения в течение игры и загрузки, когда не создается ветвь
		//вырезаем строку до номера сохранения и добавляем номер + 1
		ctrl_sv_svDir = string_copy(ctrl_sv_svDir, 0, string_last_pos("_", ctrl_sv_svDir)) + string(int64(str1) + 1);
	}
	
	directory_create(ctrl_sv_svDir);
	
	//получаю имя родительского файла 
	ini_open(ctrl_sv_ldDir + "/saveInfo.ini");
	var parent = ini_read_string("SAVE_INFO", "name", "err");
	ini_close();
	
	//данные по текущему сохранению
	ini_open(ctrl_sv_svDir + "/saveInfo.ini");
	//действительность сохранения
	ini_write_real("MAIN", "saveValid", 0);
	ini_write_string("SAVE_INFO", "parent", parent);	//созраняю имя родителя
	ini_close();
	
	//копируем файлы из папки последнего сохранения в новую папку
	if (directory_exists(ctrl_sv_ldDir)) {
		//начинаем поиск в папке загрузки
		var fname = file_find_first(ctrl_sv_ldDir + "/*.*", 0);
		//проходим по всем файлам папки предыдущего сохранения и копируем их в новую папку
		while (fname != "") {
			//только если они txt т.е. только в них содержится информация о сохранениях
			if (filename_ext(fname) == ".txt") {
				file_copy(ctrl_sv_ldDir + "/" + fname, ctrl_sv_svDir + "/" + fname);
			}
			fname = file_find_next();
		}
		file_find_close();
	}
	//обновляем папку загрузки на текущую
	ctrl_sv_ldDir = ctrl_sv_svDir;
}
