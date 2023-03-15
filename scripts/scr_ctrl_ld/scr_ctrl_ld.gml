/// @function scr_ld_ReLdBtn(action);
/// @param action что нужно сделать 
/// @description отвечает за прокрутку списка сохранений, за удаление конкретного сохранения 

function scr_ld_ReLdBtn(action) {
	
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
		var tx = room_width * 0.25;
		var ty = room_height * 0.3 + i * sprite_get_height(spr_btn_ldGm_loader1) + 50;
	
		ini_open(path + "/saveInfo.ini");	//информация о конкретном сохранении
		
		var obj = instance_create_depth(tx, ty + 7 * i, depth, obj_btn_loader);
		//сохраняю id созданных кнопок, чтобы потом к ним обращаться
		array_push(btn_loaderId, obj);
		
		//настраиваю созданную кнопку-сохранение
		with (obj) {
			//настраиваем структуру информации о сохранении
			btn_infoStruct[$"path"] = path;
			
			//разбираю дату и время
			var str = ini_read_string("SAVE_INFO", "dateTime", "1 Января 2003");
			var str1 = string_copy(str, 0, string_pos(" ", str));	//разбираю на дату
			str = string_copy(str, string_pos(" ", str) + 1, 10);	//и время
			str1 = string_split(str1, "/");		//разделяю на части
			str = string_split(str, ":");
			var arr = ["Января", "Февраля", "Марта", "Апреля", "Мая", "Июня", "Июля", "Августа", "Сентября", "Октября", "Ноября", "Декабря"];
			btn_infoStruct[$"dateTime"] = str1[1] + " " + arr[int64(str1[0]) - 1] + " " + str1[2] + " в " + str[0] + ":" + str[1];
			btn_infoStruct[$"dateTimeGm"] = ini_read_string("SAVE_INFO", "dateTimeInGame", "1 Января 2003");
			btn_infoStruct[$"quest"] = ini_read_string("SAVE_INFO", "quest", "Лень выполнять квесты");
			btn_infoStruct[$"location"] = ini_read_string("SAVE_INFO", "location", "Дома на диване");
			btn_infoStruct[$"parent"] = ini_read_string("SAVE_INFO", "parent", "Еще не сделал");
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
/// @param {} path - корень, в котором ищем папки
/// @param {} m - номер ветки branch_m
/// @description находит все папки сохранений последовательно и сохраняет пути в массив
	//рекурсивная функция. Находит номер последнего сохранения 
function scr_ld_findSvPaths(path, m) {	
	//проходим по всем сохранениям в папке path
	while (directory_exists(path)) {
		//если в папке path есть ветви, проходим по всем и запускаем рекурсию по всем ветвям
		while (directory_exists(path + "/branch_" + string(m))) {
			scr_ld_findSvPaths(path + "/branch_" + string(m) + "/save_1", m);
			m++;
		}
		m = 1;
		//добавляем найденный путь в массив
		array_push(ctrl_ldGm_svPaths, path);
		//получаем номер автоВыбранного сохранения. В случае выбора другой папки игры не сработает
		if (path == ctrl_ldGm_sv_currPath) {	//если этот путь, равен пути последнего сохранения
			//задаем номер последнего сохранения
			ctrl_ldGm_sv_curr = array_length(ctrl_ldGm_svPaths) - 1;
		}
		//получаем номер сохранения
		var num = int64(string_copy(path, string_last_pos("_", path) + 1, 10));
		//ищем следуюущую папку сохранения
		path = string_copy(path, 0, string_last_pos("_", path)) + string(num + 1);
	}
	//общее количество сохранений
	ctrl_ldGm_sv = array_length(ctrl_ldGm_svPaths);
}