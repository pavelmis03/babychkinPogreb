/// @function scr_sv_svRm(file_path);
/// @param {} file_path путь к файлу
/// @description создает файл сохранения комнаты, в который записывает все сохраняемые экземпляры и их параметры
	
function scr_sv_svRm(file_path) {
	//открывая файл для записи, мы затираем его
	var file = file_text_open_write(file_path);
	
	//цикл по сохраняемым объектам 
	for (var i = 0; i < array_length(ctrl_sv_saveInst); i++) {
		//и по их экз. в комнате
		for (var j = 0; j < instance_number(ctrl_sv_saveInst[i]); j++) {
			//так нахожу экз объекта по номеру 
			var tId = instance_find(ctrl_sv_saveInst[i], j);
			var name = object_get_name(tId.object_index);
			//таким образом один экз. отделяет от другого (а-ля заголовок)
			if (i == 0 and j == 0) {	//первый раздел начинается с первой строки файла
				file_text_write_string(file, "INST");	//заголовок раздела
			} else {
				file_text_write_string(file, "\n\nINST");	//заголовок раздела
			}
			
			//самые важные переменные записываю вручную для наглядности
			file_text_write_string(file, "\nobj_name = " + name);
			file_text_write_string(file, "\nx = " + string(tId.x));
			file_text_write_string(file, "\ny = " + string(tId.y));
			file_text_write_string(file, "\ndepth = " + string(tId.depth));
			
			//записываю остальные переменные которые имеет смысл сохранить, если они есть у сохраняемого экз.
			for (var k = 0; k < array_length(ctrl_sv_saveVar); k++) {
				var val = variable_instance_get(tId, ctrl_sv_saveVar[k]);
				if (val != undefined) {
					file_text_write_string(file, "\n" + ctrl_sv_saveVar[k] + " = " + string(val));
				}
			}
			
			//ограничитель. нужен для корректного считывания при загрузке
			file_text_write_string(file, "\r\n\r\n");
		}
	}
	file_text_close(file);
}



