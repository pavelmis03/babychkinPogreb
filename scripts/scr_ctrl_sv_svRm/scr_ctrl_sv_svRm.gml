/// @function scr_sv_svRm(save_path);
/// @param {} save_path путь к папке, где нужно сохранение
/// @description создает файл сохранения комнаты, в который записывает все сохраняемые экземпляры и их параметры
	
function scr_sv_svRm(save_path) {
	var file1 = file_text_open_write(save_path + "/" + room_get_name(room) + ".txt");	//файл для обычных объектов
	var file2 = file_text_open_append(save_path + "/travelersObj.txt");	//объекты, перемещающиеся по комнатам
	var file = file1;	//в зависимости от типа (need_sv) сохраняемого объекта file = file1/file2
	
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
				} else {
					file = file2;
					//проверяем, что мы еще не сохраняли данный объект, если это не так, удаляем его
					//данные, чтобы записать их заново
					if (scr_file_findStr(file, name) != 0) {
						//удаление из файла ненужного объекта
					}
				}
				//таким образом один экз. отделяет от другого (а-ля заголовок)
				if (i == 0) {	//первый раздел начинается с первой строки файла
					file_text_write_string(file, "INST");	//заголовок раздела
				} else {
					file_text_write_string(file, "\n\nINST");	//заголовок раздела
				}
		
				//самые важные переменные записываю вручную для наглядности
				file_text_write_string(file, "\nobj_name = " + name);
				file_text_write_string(file, "\nx = " + string(tId.x));
				file_text_write_string(file, "\ny = " + string(tId.y));
				file_text_write_string(file, "\ndepth = " + string(tId.depth));
				file_text_write_string(file, "\ndirection = " + string(tId.direction));
				//сохраняю везде, но нужно для перемещаемых объектов. Комната, где объект был сохранен
				file_text_write_string(file, "\nsvRoom = " + room_get_name(room));	
				
				//cохраняю все переменные экземпляра
				var tarr = variable_instance_get_names(tId);
				
				for (var k = 0; k < array_length(tarr); k++) {
					var val = variable_instance_get(tId, tarr[k]);
					file_text_write_string(file, "\n" + tarr[k] + " = " + string(val));
				}
			
				//ограничитель. нужен для корректного считывания при загрузке
				file_text_write_string(file, "\r\n\r\n");
			}
		}
	}
	
	file_text_close(file);
}



