/// @description здесь загружается массив текстов для журнала
//проверяет наличие файла, если существует, читает из него данные, если нет, создает, а потом читает


var flag = false;
//произойдет запись файла, если его не существует
if (!file_exists("journalInfo.ini")) {
	flag = true;
}

//переносим в память информацию из файла
ini_open("journalInfo.ini");
//ориентируемся по ключам в словаре, причем их порядок неважен 
var el = ds_map_find_first(ctrl_jrn_map_txt);
//переписываем инофрмацию из файла по разделам
for (var i = 0; i < ds_map_size(ctrl_jrn_map_txt); i++) {
	if (flag) {	//если файла не существует, создаем его по умолчанию 
		var t = ctrl_jrn_map_txt[?el];
		ini_write_string(el, "0", t[0]);	//0 - заголовое
	}
	var j = 0;
	//массив строк, относящихся к разделу
	var arr = [];
	//пока существует ключ под номером j, я записываю строки из раздела
	while (ini_key_exists(el, string(j))) {
		arr[j] = ini_read_string(el, string(j), "");
		j++;
	}
	//добавляю получившийся массив строк к словарю текстов в журнале, в данный раздел
	array_copy(ctrl_jrn_map_txt[?el], 0, arr, 0, array_length(arr));
	el = ds_map_find_next(ctrl_jrn_map_txt, el);
}
ini_close();

