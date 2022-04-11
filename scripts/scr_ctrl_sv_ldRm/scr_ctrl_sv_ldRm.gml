/// @function scr_sv_ldRm(file_path);
/// @param {} file_path путь к файлу
/// @description обновляет комнату, удаляя и пересоздавая из файла сохранения комнаты сохраняемые экземпляры

function scr_sv_ldRm(file_path) {
	if (file_exists(file_path)) {
		var file = file_text_open_read(file_path);
		//[|i[j]] - двумерный список, состоящий из спискf экзепляров, для каждого из которых записан массив переменных
		//instArr[|i] - экземпляр, instArr[|i][j] - переменная, причем instArr[|i]["obj_name", x, y, depth, ...]
		var instArr = ds_list_create();
		var j = 0;
		
		//считываю файл в список списков для упрощения дальнейшей работы
		while (!file_text_eof(file)) {
			var s = file_text_readln(file);
			s = string_delete(s, string_length(s) - 1, 2);	//удаляю перенос строки
			//заголовок, показывает, что начались данные нового экземпляра 
			if (s == "INST") {
				//создаю список переменных экзепляра
				ds_list_add(instArr, ds_list_create());
				//считываю первую переменную 
				s = file_text_readln(file);
				s = string_delete(s, string_length(s) - 1, 2);
				//читаю последующие (eof нужен для того, чтобы прекратить цикл, считывающий последний экземпляр в файле)
				while (s != "" and !file_text_eof(file)) {
					ds_list_add(instArr[|j], s);	//добавляю переменную в виде ,,var = val,,
					s = file_text_readln(file);
					s = string_delete(s, string_length(s) - 1, 2);
				}
				j++;
			}
		}
	
		//обновляю данные в комнате, проходя по всем сохраняемым объектам 
		for (var i = 0; i < array_length(ctrl_sv_saveInst); i++) {
			//удаляю все экземпляры данного объекта в комнате
			for (var j = 0; j < instance_number(ctrl_sv_saveInst[i]); j++) {
				instance_destroy(instance_find(ctrl_sv_saveInst[i], j));
				j--;
			}
			//создаю их заново с переназначая сохраненные переменные
			for (var j = 0; j < ds_list_size(instArr); j++) {
				//индекс объекта, от которого создам экз
				var obj = asset_get_index(scr_sv_getVal(instArr[|j][|0]));
				if (ctrl_sv_saveInst[i] == obj) {
					//[obj_name, x, y, depth, ...]
					var inst = instance_create_depth(scr_sv_getVal(instArr[|j][|1]), 
														scr_sv_getVal(instArr[|j][|2]), 
														scr_sv_getVal(instArr[|j][|3]), obj);
				
					//цикл по переменным экземпляра
					for (var k = 4; k < ds_list_size(instArr[|j]); k++) {
						//считываю значение переменной и пытаюсь преобразовать ее из строки
						var val = scr_sv_getVal(instArr[|j][|k]);
						variable_instance_set(inst, scr_sv_getName(instArr[|j][|k]), bool(val));
						if (is_int64(val)) { 
							variable_instance_set(inst, scr_sv_getName(instArr[|j][|k]), int64(val));
						}
						if (is_real(val)) { 
							variable_instance_set(inst, scr_sv_getName(instArr[|j][|k]), real(val));
						}
						if (is_bool(val)) { 
							variable_instance_set(inst, scr_sv_getName(instArr[|j][|k]), bool(val));
						}
					}
					//удаляю сначала список переменных, потом саму ячейку экземпляра
					ds_list_destroy(instArr[|j]);
					ds_list_delete(instArr, j)
					j--;
				}
			}
		}
	
		ds_list_destroy(instArr);
		file_text_close(file);
	}
	
}
