/// @function scr_sv_svRm(save_path);
/// @param {} save_path путь к папке, где нужно сохранение
/// @description создает файл сохранения комнаты, в который записывает все сохраняемые экземпляры и их параметры
	
/*
все перемещающиеся объекты всегда постоянны - это контроллеры. 
поэтому мы всегда знаем, что все перемещающиеся объекты сохраняются в любом случае
сохраняем их в отдельный файл
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
				file_text_write_string(file, "\nobj_name = " + name);
				/* не нужно т.к. изменилась логика сохранения
				if (tId.need_sv == 2) {
					//информация только для перемещаемых объектов. Комната, где объект был сохранен и id
					file_text_write_string(file, "\nsvRoom = " + room_get_name(room));	
					file_text_write_string(file, "\nid = " + string(tId));	
				}
				*/
				file_text_write_string(file, "\nx = " + string(tId.x));
				file_text_write_string(file, "\ny = " + string(tId.y));
				file_text_write_string(file, "\ndepth = " + string(tId.depth));
				file_text_write_string(file, "\ndirection = " + string(tId.direction));
				
				//cохраняю все переменные экземпляра
				var tarr = variable_instance_get_names(tId);
				
				for (var k = 0; k < array_length(tarr); k++) {
					var val = variable_instance_get(tId, tarr[k]);
					file_text_write_string(file, "\n" + tarr[k] + " = " + string(val));
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





