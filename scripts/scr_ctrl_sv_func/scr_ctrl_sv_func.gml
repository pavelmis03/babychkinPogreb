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