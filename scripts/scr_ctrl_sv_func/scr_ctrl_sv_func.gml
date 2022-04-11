/// @function scr_sv_findVal(list, name);
/// @param {} list список для поиска
/// @param {} name имя переменной
/// @description	находит в списке переменную по имени и получает ее значение
///					из строки типа ,,var = val,,
/*
function scr_sv_findVal(list, name) {
	
}
*/

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

/// @function scr_sv_dtDirName();
/// @description возвращает строку, состоящую из даты и времени, пригодную для названия папки
function scr_sv_dtDirName() {
	//создаем строку дата_время
	var str = date_datetime_string(date_current_datetime());

	//удаляет из строки недопустимые символы
	str = string_replace_all(str, " ", "-");
	str = string_replace_all(str, "/", "-");
	str = string_replace_all(str, ":", "-");
	
	str = "_" + str + "_";
	
	return str;
}

