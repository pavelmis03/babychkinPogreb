/// @function scr_ctrl_sv_ldRm(file_path);
/// @param {} file_path путь к файлу сохранения
/// @description обновляет комнату, удаляет и пересоздает все объекты, подлежащие сохранению

function scr_ctrl_sv_ldRm(file_path) {
	//если есть сохранение переданной комнаты6
	if (file_exists(file_path)) {	
		
 		{  //прошлая версия цикла v2
		/* ПРОШЛАЯ ВЕРСИЯ V2
		//var file = file_text_open_read(file_path);
		//[|i[|j]] - двумерный список, состоящий из списка экзепляров, для каждого из которых записан массив переменных
		//instArr[|i] - экземпляр, instArr[|i][|j] - переменная, причем instArr[|i][|"obj_name", x, y, depth, direction, ...] - первые переменные фиксированы
		var instArr = ds_list_create();
		var j = 0;
		
		//считываю файл в список списков для упрощения дальнейшей работы
		while (!file_text_eof(file)) {
			var s = file_text_readln(file);
			//проверить, что удалять надо именно два символа ↓
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
													//сначала добавляю, потом считываю, потому что последние строки
													//перед следющим экземпляром пустые
					s = file_text_readln(file);
					s = string_delete(s, string_length(s) - 1, 2);
				}
				j++;
			}
		}
		*/
		}
		{  //прошлая версия цикла v1
		/*
		УСТАРЕЛО V1
			теперь все объекты, которые нужно сохранять, будут иметь переменную need_sv = 1
			и все их переменные будут сохраняться полностью
		//обновляю данные в комнате, проходя по всем сохраняемым объектам 
		for (var i = 0; i < array_length(ctrl_sv_saveInst); i++) {
			//удаляю все экземпляры данного объекта в комнате
			for (var j = 0; j < instance_number(ctrl_sv_saveInst[i]); j++) {
				instance_destroy(instance_find(ctrl_sv_saveInst[i], j));
				j--;
			}
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
		*/
		}
		
		//обновляю данные в комнате, проходя по всем сохраняемым объектам 
		for (var i = 0; i < instance_count; i++) {
			//так нахожу экз объекта по номеру 
			var tId = instance_id_get(i);
			//если переменная существует и показывает, что надо сохранять этот экземпляр
			//проверка на существование, чтобы не писать в каждом экземпляре need_sv = 0
			if (variable_instance_exists(tId, "need_sv")) {
				if (tId.need_sv == 1) {	//если это сохраняемый экземпляр, мы его удаляем
					instance_destroy(tId);
					i--;
				}
			}
		}
		
		{	//прошлая версия V1, V2
		/*		
		//создаю их заново, переназначая сохраненные переменные
		for (var j = 0; j < ds_list_size(instArr); j++) {
			//индекс объекта, от которого создам экз
			var obj = asset_get_index(scr_sv_getVal(instArr[|j][|0]));
			//["obj_name", x, y, depth, ...]
			var inst = instance_create_depth(scr_sv_getVal(instArr[|j][|1]), 
												scr_sv_getVal(instArr[|j][|2]), 
												scr_sv_getVal(instArr[|j][|3]), obj);
				
			//цикл по переменным экземпляра
			for (var k = 4; k < ds_list_size(instArr[|j]); k++) {
				//считываю значение переменной и пытаюсь преобразовать ее из строки
				var val = scr_sv_getVal(instArr[|j][|k]);
				if (is_int64(val)) { 
					variable_instance_set(inst, scr_sv_getName(instArr[|j][|k]), int64(val));
				} else {
					if (is_real(val)) { 
						variable_instance_set(inst, scr_sv_getName(instArr[|j][|k]), real(val));
					} else {
						if (is_bool(val)) { 
							variable_instance_set(inst, scr_sv_getName(instArr[|j][|k]), bool(val));
						} else {
							variable_instance_set(inst, scr_sv_getName(instArr[|j][|k]), bool(val));
						}
					}
				}
			}
			//удаляю сначала список переменных, потом саму ячейку экземпляра
			ds_list_destroy(instArr[|j]);
			ds_list_delete(instArr, j)
			j--;
		}
		ds_list_destroy(instArr);
		*/
		}
		
		//создаю все объекты в комнате заново
		scr_ld_createObjFromFile(file_path);
	}
}
