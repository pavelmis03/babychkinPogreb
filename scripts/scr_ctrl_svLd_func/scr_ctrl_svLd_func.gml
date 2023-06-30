/*
/// @function scr_sv_getVal(str);
/// @param {} str строка типа ,,var = val,, из которой нужно получить значение
/// @description получает значение переменной из строки
function scr_sv_getVal(str) {
	var t = string_last_pos(" ", str) + 1;
	return string_copy(str, t, string_length(str));
}

/// @function scr_sv_getName(str);
/// @param {} str строка типа ,,var = val,, из которой нужно получить имя переменной
/// @description получает имя переменной из строки
function scr_sv_getName(str) {
	var t = string_pos(" ", str) - 1;
	return string_copy(str, 0, t);
}
*/

/// @function scr_ld_createObjFromFile(filePath);
/// @param {} filePath путь до файла, из которого нужно создать объекты
/// @description создает все объекты из файла с сохраненными характеристиками в текущей комнате
function scr_ld_createObjFromFile(filePath) {
	//открываем файл с объектами
	obj_name = 0;	//чтобы варнинга не было (эта переменная читается из файла сохранения, как ключ)
	var file = file_text_open_read(filePath);
	var objVal = {};	//переменные объекта
	while (!file_text_eof(file)) {
		var s = file_text_readln(file);	//читаем строку файла
		s = string_copy(s, 0, string_length(s) - 2);
		var arr = string_split(s, " = ");	//["переменная", "значение", "typeVal"]
		if (s == "") {	//если это была пустая строка
			if (array_length(objVal) != []) {	//если мы собрали объект
				//создаем объект, получая данные из структуры
				var obj = instance_create_depth(real(objVal.x[0]), real(objVal.y[0]), int64(objVal.depth[0]), asset_get_index(objVal.obj_name[0]));
				var keys = variable_struct_get_names(objVal);	//ключи структуры
				//проходим по всем переменным, назначая им сохраненные значения
				for (var i = 0; i < array_length(keys); i++) {
					//получаю значени структуры по ключу
					var val = variable_struct_get(objVal, keys[i]);	//[val, typeOfVal]
					//получаю преобразованную переменную, если она не структура данных
					//СД нельзя назначить никак, поэтому буду передавать, как строку, а уже в самом объекте разбирать
					if (scr_arr_fingEl(["que", "priority", "stack", "map", "list"], val[1], 1) == -1) {
						val[0] = scr_var_convVal(val[0], val[1]);
					}	
					//назначаю в любом случае. Если стрктура - как строку
					variable_instance_set(obj, keys[i], val[0]);
				}
			}
		} else {	//если мы встретили какой-то текст
			if (s == "INST") {	//если это начало описания объекта
				objVal = {};	//обнуляем структуру характеристик объекта
			} else {	//сохраняю информацию об объекте	ключ - [переменная, тип]
				variable_struct_set(objVal, arr[0], [arr[1], arr[2]]);
			}
		}
	}
	delete objVal;
	file_text_close(file);
}



















