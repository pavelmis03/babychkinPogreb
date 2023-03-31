/// @function scr_sv_svRm(save_path);
/// @param {} save_path путь к папке, где нужно сохранение
/// @description создает файл сохранения комнаты, в который записывает все сохраняемые экземпляры и их параметры
	
/*
все перемещающиеся объекты всегда постоянны - это контроллеры. 
поэтому мы всегда знаем, что все перемещающиеся объекты сохраняются в любом случае
сохраняем их в отдельный файл просто перезаписывая
*/

function scr_sv_svRm(save_path) {
	var file1 = file_text_open_write(save_path + "/" + room_get_name(room) + ".txt");	//файл для обычных объектов
	var file2 = file_text_open_write(save_path + "/travelersObj.txt");	//объекты, перемещающиеся по комнатам
	var file = file1;	//в зависимости от типа (need_sv) сохраняемого объекта file = file1/file2
	var flag = true;	//флаг того, что файл чист (если мы ничего не сохранили, надо будет удалить файл)
	
	//прохожу по всем экземплярам в комнате
	for (var i = 0; i < instance_count; i++) {
		//так нахожу экз объекта по номеру 
		var tId = instance_id_get(i);
		//получаю имя объекта
		var name = object_get_name(tId.object_index);
		//если переменная сохранять существует и показывает, что надо сохранять этот экземпляр
		//проверка на существование, чтобы не писать в каждом экземпляре need_sv = 0
		if (variable_instance_exists(tId, "need_sv")) {
			if ((tId.need_sv == 1) or (tId.need_sv == 2)) { //если это обычный объект, который надо сохранять

				//в зависимости от того, перемещаемый объект или нет, сохраняем в разные файлы
				if (tId.need_sv == 1) {
					file = file1;
					flag = false;	//сообщаем о том, что мы что-то сохранили в файл
				} else {
					file = file2;
				}
				
				file_text_write_string(file, "INST");	//заголовок раздела
				//самые важные переменные записываю вручную для наглядности
				//сохраняю тип данных
				file_text_write_string(file, "\nobj_name = " + name + " = str");
				file_text_write_string(file, "\nx = " + string(tId.x) + " = real");
				file_text_write_string(file, "\ny = " + string(tId.y) + " = real");
				file_text_write_string(file, "\ndepth = " + string(tId.depth) + " = int");
				file_text_write_string(file, "\ndirection = " + string(tId.direction) + " = real");
				file_text_write_string(file, "\nsprite_index = " + string(tId.sprite_index) + " = int");
				//file_text_write_string(file, "\nsprite_width = " + string(tId.sprite_width) + " = real");
				//file_text_write_string(file, "\nsprite_height = " + string(tId.sprite_height) + " = real");
				//file_text_write_string(file, "\sprite_xoffset = " + string(tId.sprite_xoffset) + " = real");
				//file_text_write_string(file, "\sprite_yoffset = " + string(tId.sprite_yoffset) + " = real");
				file_text_write_string(file, "\nimage_alpha = " + string(tId.image_alpha) + " = real");
				file_text_write_string(file, "\nimage_angle = " + string(tId.image_angle) + " = real");
				file_text_write_string(file, "\nimage_index = " + string(tId.image_index) + " = int");
				file_text_write_string(file, "\nimage_speed = " + string(tId.image_speed) + " = real");
				file_text_write_string(file, "\nimage_xscale = " + string(tId.image_xscale) + " = real");
				file_text_write_string(file, "\nimage_yscale = " + string(tId.image_yscale) + " = real");
				file_text_write_string(file, "\nspeed = " + string(tId.speed) + " = real");
				file_text_write_string(file, "\nvisible = " + string(tId.visible) + " = bool");
				
				//cохраняю все переменные экземпляра
				var tarr = variable_instance_get_names(tId);
				
				for (var k = 0; k < array_length(tarr); k++) {
					var tflag = true;
					if (variable_instance_exists(tId, "nonSvVar")) {
						//если текущая переменная в массиве несохраняемых переменных
						if (scr_arr_fingEl(tId.nonSvVar, tarr[k], 1) != -1) {
							tflag = false;	//запрещаем ее сохранять
						}
					}
					if (tflag) {
						var val = variable_instance_get(tId, tarr[k]);
						//определяем тип сохраняемой переменной 
						var type = scr_var_typeOf(val, tarr[k]);
						switch (type) {	//если это структура, их надо сохранять особым образом
							case "que": val = ds_queue_write(val); break;
							case "priority": val = ds_priority_write(val); break;
							case "stack": val = ds_stack_write(val); break;
							case "grid": val = ds_grid_write(val); break;
							case "map": val = ds_map_write(val); break;
							case "list": val = ds_list_write(val); break;
						}
						//сохраняю имя переменной, тип данных, значение 
						file_text_write_string(file, "\n" + tarr[k] + " = " + string(val) + " = " + type);
					}
				}
				
				//ограничитель. нужен для корректного считывания при загрузке
	 			file_text_write_string(file, "\n\n");
			}
		}
	}	
	
	file_text_close(file1);
	file_text_close(file2);
	
	//если файл сохранения комнаты получился пустой (никого не сохранили), удаляем его
	if (flag) {
		file_delete(save_path + "/" + room_get_name(room) + ".txt");
	}
}





