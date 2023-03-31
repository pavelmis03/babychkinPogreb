/// @function scr_ld_delGm(path);
/// @param path путь удаляемой игры 
/// @description удаляет игру
function scr_ld_delGm(path) {
	//удаляем папку игры
	directory_destroy(path);
	
	array_delete(ctrl_ldGm_gmPaths, array_get_index(ctrl_ldGm_gmPaths, ctrl_ldGm_gm_currPath), 1);
	ctrl_ldGm_gm--;
	//если это была последняя игра
	if (ctrl_ldGm_gm == 0) {
		//удаляем кнопки-сохранений
		instance_destroy(obj_btn_loader);
		//запускаем новую игру
		event_user(14);
	} else {
		//если это не последняя игра была, назначаем другую
		ctrl_ldGm_gm_currPath = array_last(ctrl_ldGm_gmPaths);	
		//определяем номер игры по индексу
		ctrl_ldGm_gm_curr = scr_arr_fingEl(ctrl_ldGm_gmPaths, ctrl_ldGm_gm_currPath, 1);
		ctrl_ldGm_svPaths = [];
		//нахожу все папки сохранений
		scr_ld_findSvPaths(ctrl_ldGm_gm_currPath);
		//общее количество сохранений
		ctrl_ldGm_sv = array_length(ctrl_ldGm_svPaths);
		//назначаем последнее сохранение
		ctrl_ldGm_sv_curr = array_length(ctrl_ldGm_svPaths) - 1;
		ctrl_ldGm_sv_currPath = array_last(ctrl_ldGm_svPaths);	
		
		//общее количество сохранений
		ctrl_ldGm_sv = array_length(ctrl_ldGm_svPaths);
	
		//номер страницы считаем после того, как получили номер сохранения
		ctrl_ldGm_page_curr = ceil((ctrl_ldGm_sv_curr + 1) / ctrl_ldGm_svOnPage);	//подстраиваем страницу под номер сохранения
		//количество страниц считаем после того, как посчитали количество сохранений
		ctrl_ldGm_page = ceil(ctrl_ldGm_sv / ctrl_ldGm_svOnPage);
		//обновить все переменные
	
		scr_ld_createLdBtn();	//создание кнопок-загрузчиков
	}
}

/// @function scr_ld_delSv(path);
/// @param path путь удаляемого сохранения 
/// @description удаляет сохранение
function scr_ld_delSv(path) {
	//удаляем папку сохранения
	directory_destroy(path);
	
	var parentPath = string_copy(path, 0, string_last_pos("/", path) - 1);	//копируем путь без последней папки (/save_
	var flag = false;	//проверка на то, что, кроме нашего сохранения, были и другие папки в родитеской папке
	//удаляю несуществующие пути
	//после удаления папки сохранения ветви тоже удаляются 
	for (var i = 0; i < array_length(ctrl_ldGm_svPaths); i++) {
		if (!directory_exists(ctrl_ldGm_svPaths[i])) {
			array_delete(ctrl_ldGm_svPaths, i, 1);
			i--;
		} else {//если папка не подлежит удалению (существует)
			//копируем путь до родителя
			var tPath = string_copy(ctrl_ldGm_svPaths[i], 0, string_last_pos("/", ctrl_ldGm_svPaths[i]) - 1)
			//если мы нашли другие сохранения в папке-родителе нашего сохранения
			if (tPath == parentPath) {
				flag = true;	//запоминаем это
			}
		}
	}
	
	//если папка родителя - ветвь
	var t = string_last_pos("/", parentPath) + 1;
	if (string_copy(parentPath, t, string_last_pos("_", parentPath) - t) == "branch") {
		if (!flag) {	//если в ней нет других сохранений
			directory_destroy(parentPath);	//удаляем ее
		}
	}
	
	//если это было последнее сохранение в игре
	if (array_length(ctrl_ldGm_svPaths) == 0) {
		scr_ld_delGm(ctrl_ldGm_gm_currPath);
		/*
		//удаляем текущую игру
		directory_destroy(ctrl_ldGm_gm_currPath);
		array_delete(ctrl_ldGm_gmPaths, array_get_index(ctrl_ldGm_gmPaths, ctrl_ldGm_gm_currPath), 1);
		ctrl_ldGm_gm--;
		//если это была последняя игра
		if (ctrl_ldGm_gm == 0) {
			//удаляем последнюю кнопку-сохранение
			instance_destroy(obj_btn_loader);
			//запускаем новую игру
			event_user(14);
		} else {
			//если это не последняя игра была, назначаем другую
			ctrl_ldGm_gm_currPath = array_last(ctrl_ldGm_gmPaths);	
			//определяем номер игры по индексу
			ctrl_ldGm_gm_curr = scr_arr_fingEl(ctrl_ldGm_gmPaths, ctrl_ldGm_gm_currPath, 1);
			//нахожу все папки сохранений
			scr_ld_findSvPaths(ctrl_ldGm_gm_currPath);
			//общее количество сохранений
			ctrl_ldGm_sv = array_length(ctrl_ldGm_svPaths);
			//назначаем последнее сохранение
			ctrl_ldGm_sv_curr = array_length(ctrl_ldGm_svPaths) - 1;
			ctrl_ldGm_sv_currPath = array_last(ctrl_ldGm_svPaths);	
		}*/
	} else {
		//если это не последнее сохранение 
		//беру следующее сохранение (они же сдвигаются влево)
		//вычитаю количество удаленных сохранений (чтобы оказаться в том же месте)
		ctrl_ldGm_sv_curr = clamp(ctrl_ldGm_sv_curr, 0, array_length(ctrl_ldGm_svPaths) - 1);
		ctrl_ldGm_sv_currPath = ctrl_ldGm_svPaths[ctrl_ldGm_sv_curr];
	
		//общее количество сохранений
		ctrl_ldGm_sv = array_length(ctrl_ldGm_svPaths);
	
		//номер страницы считаем после того, как получили номер сохранения
		ctrl_ldGm_page_curr = ceil((ctrl_ldGm_sv_curr + 1) / ctrl_ldGm_svOnPage);	//подстраиваем страницу под номер сохранения
		//количество страниц считаем после того, как посчитали количество сохранений
		ctrl_ldGm_page = ceil(ctrl_ldGm_sv / ctrl_ldGm_svOnPage);
		//обновить все переменные
	
		scr_ld_createLdBtn();	//создание кнопок-загрузчиков
	}
}

/// @function scr_ld_createLdBtn();
/// @description создает кнопку сохранения
function scr_ld_createLdBtn() {
	//если есть кнопки загрузок сохранений, удаляю их перед созданием новых
	if (instance_exists(obj_btn_loader)) {
		instance_destroy(obj_btn_loader);
		//очищаю массив кнопок-загрузчиков
		btn_loaderId = [];
		btn_loaderNum = 0;
	}
	
	var t_num = -1;
	
	//здесь создаем пять кнопок-загрузок
	for (var i = 0; (i < ctrl_ldGm_svOnPage) and (t_num + 1 < ctrl_ldGm_sv); i++) {
		t_num = (ctrl_ldGm_page_curr - 1) * ctrl_ldGm_svOnPage + i; //номер кнопки на экране
		var path = ctrl_ldGm_svPaths[t_num];	//путь сохранения
		var tx = room_width * 0.368;
		var ty = room_height * 0.263 + i * sprite_get_height(spr_btn_ldGm_loader1) + 7;
	
		ini_open(path + "/saveInfo.ini");	//информация о конкретном сохранении
		
		var obj = instance_create_depth(tx, ty + 10 * i, depth, obj_btn_loader);
		//сохраняю id созданных кнопок, чтобы потом к ним обращаться
		array_push(btn_loaderId, obj);
		
		//настраиваю созданную кнопку-сохранение
		with (obj) {
			//настраиваем структуру информации о сохранении
			btn_infoStruct[$"path"] = path;
			
			//разбираю дату и время
			var str = ini_read_string("SAVE_INFO", "dateTime", "1/1/2000 6:6:6 AM");
			var str1 = string_copy(str, 0, string_pos(" ", str));	//разбираю на дату
			str = string_copy(str, string_pos(" ", str) + 1, 10);	//и время
			str1 = string_split(str1, "/");		//разделяю на части
			str = string_split(str, ":");
			var arr = ["Января", "Февраля", "Марта", "Апреля", "Мая", "Июня", "Июля", "Августа", "Сентября", "Октября", "Ноября", "Декабря"];
			btn_infoStruct[$"dateTime"] = str1[1] + " " + arr[int64(str1[0]) - 1] + " " + str1[2] + " в " + str[0] + ":" + str[1];
			btn_infoStruct[$"dateTimeGm"] = ini_read_string("SAVE_INFO", "dateTimeInGame", "1 Января 2003");
			btn_infoStruct[$"quest"] = ini_read_string("SAVE_INFO", "quest", "Лень выполнять квесты");
			btn_infoStruct[$"location"] = ini_read_string("SAVE_INFO", "location", "Дома на диване");
			btn_infoStruct[$"parent"] = scr_str_parsPath(ini_read_string("SAVE_INFO", "parent", "err"));
			btn_infoStruct[$"name"] = scr_str_parsPath(ini_read_string("SAVE_INFO", "name", "err"));
			btn_infoStruct[$"number"] = t_num;
			//скрин сохранения
			draw_img = sprite_add(path + "/svScreenShot.png", 1, true, true, 0, 0);
			
			sprite_index = spr_btn_ldGm_loader1;
			type = "func";
			action = "selectLoaderBtn";
			sound = [20, "snd_none", "snd_none"]; 
			btn_enable = true;
		}
		//если номер создаваемой кнопки совпадает с номером выбранной, делаем ее активной
		if (t_num == ctrl_ldGm_sv_curr) {
			btn_loaderNum = i;		//связываем контроллер загрузок с кнопкой-загрузчиком
		}
	
		ini_close();
	}
}

/// @function scr_ld_findSvPaths();
/// @param {} path - корневая папка (игра или ветка)
/// @description находит все папки сохранений, сортируя по длине пути. 
	//Проверяет действительность сохранения, если оно недействительно, удаляет папку
function scr_ld_findSvPaths(path) {	
	var arr = [path + "/"];	//в этот массив заношу все найденные папки, чтобы позже проверить, есть ли в них ветви 
	var arr1 = [];	//в этот массив сохраняю пути, которые надо удалить
	
	//пока не проверю все, что нашел
	while (array_length(arr) != 0) {
		var i = 0;	//номер папки, в которой ищем ветви
		var fn = file_find_first(arr[i] + "*", fa_directory);
		//прохожу по выбранной папке в поисках ветвей
		while ((fn != "") and (string_pos(".", fn) == 0)) {
			//если это папка ветви, ее сохранять не нужно
			if (string_copy(fn, 0, string_pos("_", fn)) != "branch_") {
				ini_open(arr[i] + fn + "/saveInfo.ini");
				//если сохранение действительно
				if (ini_read_real("MAIN", "saveValid", 0) != 0) {
					//а если это сохранение в ветви и оно действительно, то сохраняем, хех, сохранение
					array_push(ctrl_ldGm_svPaths, arr[i] + fn);
				} else { //иначе удаляем его
					//directory_destroy(arr[i] + fn);
					array_push(arr1, arr[i] + fn);	//запоминаем пустые сохранения
				}
				ini_close();
			}
			//ищем вложенные папки
			array_push(arr, arr[i] + fn + "/");
		
			fn = file_find_next();
		}
		file_find_close();
		//удаляем папку, которую проверили на потомков
		array_delete(arr, i, 1);
	}
	
	//удаляем пустые сохранения
	for (var i = 0; i < array_length(arr1); i++) {
		scr_ld_delSv(arr1[i]);
	}
	
	//сортируем массив путей, чтобы были по порядку
	array_sort(ctrl_ldGm_svPaths, true);
}