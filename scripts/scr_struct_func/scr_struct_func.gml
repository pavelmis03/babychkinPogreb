/// @function scr_struct_readFromStr(str);
/// @param {} str строка, из которой читаем структуру
/// @description возвращает структуру из строки
function scr_struct_readFromStr(str) {
	//нафиг надо. лучше сощдать словарь, если нужно сохранять
	/*
	var s = {};
	//удаляю пробелы
	str = string_replace_all(str, " ", "");
	//удаляю внешние скобки 
	str = string_delete(str, 1, 1);
	str = string_delete(str, string_length(str), 1);
	
	//получаю массив пар
	var arr = string_split(str, ",");
	
	for (var i = 0; i < array_length(arr); i++) {
		var t = string_split(arr[i], ":");	//получаю ключ и значение
		//ВОТ НА МОМЕНТЕ ПОЛУЧЕНИЯ ТИПА ЭЛЕМЕНТА СТРУКТУРЫ Я СЛОМАЛСЯ И РЕШИЛ НЕ ЧИТАТЬ ИХ ИЗ СТРОК
		variable_struct_set(s, t[0], scr_var_convVal(t[1], "str"));
	}
	
	return s;*/
}