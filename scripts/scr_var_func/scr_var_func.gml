/// @function scr_var_typeOf(val, varName);
/// @param {} val - переменная, тип которой мы определяем
/// @param {} varName - име переменной, с которой мы работаем
/// @description определяет в удобном виде тип переменной, возвращает строку.
	//типы структур определяет по именам переменных
function scr_var_typeOf(val, varName) {
	var type = val;
	
	switch (typeof(val)) {
		case "number": type = "real"; break;
		case "bool": type = "bool"; break;
		case "int32": type = "int"; break;
		case "int64": type = "int"; break;
		case "struct": type = "struct"; break;
		case "ref": type = "inst"; break;
		case "array": type = "arr"; break;
		case "string": type = "str"; break;
		//пока не нужные
		case "ptr": type = "ptr"; break;
		case "undefined": type = "undefined"; break;
		case "null": type = "null"; break;
		case "vec3": type = "vec3"; break;
		case "vec4": type = "vec4"; break;
		case "method": type = "method"; break;
	}
	
	//попытка определить тип структуры. (функция ds_exists может ошибаться и принимать одни структуры за другие)
	if (typeof(val) == "number") {
		//в имени каждой структуры есть ее тип, по имени определяю тип структуры
		if (string_count("_queue_", varName) != 0) {
			type = "queue";
		}
		if (string_count("_priority_", varName) != 0) {
			type = "priority";
		}
		if (string_count("_stack_", varName) != 0) {
			type = "stack";
		}
		if (string_count("_grid_", varName) != 0) {
			type = "grid";
		}
		if (string_count("_map_", varName) != 0) {
			type = "map";
		}
		if (string_count("_list_", varName) != 0) {
			type = "list";
		}
	}
	
	return type;
}

/// @function scr_var_typeOfAsset(val);
/// @param {} val - переменная, тип ресурса которой мы определяем
/// @description определяет в удобном виде тип ресурса
function scr_var_typeOfAsset(val) {
	var type = val;
	
	switch (asset_get_type(val)) {
		case asset_object: type = "obj"; break;
		case asset_sprite: type = "spr"; break;
		case asset_sound: type = "snd";	break;
		case asset_room: type = "rm"; break;
		case asset_tiles: type = "tl"; break;
		case asset_path: type = "path"; break;
		case asset_script: type = "sct"; break;
		case asset_font: type = "fnt"; break;
		case asset_timeline: type = "tml"; break;
		case asset_shader: type = "shdr"; break;
		case asset_animationcurve: type = "animcrv"; break;
		case asset_sequence: type = "sqn"; break;
		case asset_unknown: type = "unkn"; break;
		//case asset_particlesystem: type = "method"; break;
		//default: 
			//if () {}
	}
	
	return type;
}

/// @function scr_var_convVal(val, type);
/// @param {} val - переменная, которую нужно преобразовать
/// @param {} type - в какой тип надо преобразовать
/// @description преобразовывает тип переданной переменной в указанный
function scr_var_convVal(val, type) {
	try {
		switch (type) {
			case "real": val = real(val); break;
			case "bool": val = bool(val); break;
			case "int": val = int64(val);break;
			case "str": val = string(val);break;
			case "struct": val = scr_struct_readFromStr(val); break;
			case "inst": val = val; break;	//вызывать чтение экземпляра из строк
			case "arr": val = scr_arr_readFromStr(val); break;
			//пока не нужные
			case "ptr": val = real(val); break;
			case "undefined": val = real(val); break;
			case "null": val = real(val); break;
			case "vec3": val = real(val); break;
			case "vec4": val = real(val); break;
			case "method": val = real(val); break;
		}
	}
	catch(_except) {
		show_debug_message(_except.message);
	    show_debug_message(_except.longMessage);
	    show_debug_message(_except.script);
	    show_debug_message(_except.stacktrace);
	}
	
	return val;
}
	