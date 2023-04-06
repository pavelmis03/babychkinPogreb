/// @description здесь загружается массив текстов для журнала
//проверяет наличие файла, если существует, читает из него данные, если нет, создает, а потом читает

var flag = false;	//существует или нет файл инфо журнала
var str = "";		//папка последней игры
//сначала пробую получить путь игры из контроллера сохранений (если мы играем прямо сейчас)
if (directory_exists(obj_ctrl_gm_sv.ctrl_sv_gmDir)) {
	str = obj_ctrl_gm_sv.ctrl_sv_gmDir + "/";
} else { 
	//если мы не играем, проверяю, сохранена ли он нас информация о последней игре
	if (file_exists("gameInfo.ini")) {
		ini_open("gameInfo.ini");
		//если да, то буду загружать информацию оттуда
		if (directory_exists(ini_read_string("GAMEINFO", "lastGame", "saves/game_0"))) {
			//если существует, добавляю разделительный слэш между путем игры и именем файла
			str = ini_read_string("GAMEINFO", "lastGame", "saves/game_0") + "/";	
		}	//иначе будем загружать информацию из корня папки GMS - инфа по умолчанию
		ini_close();
	}
}

//произойдет запись файла, если его не существует
if (!file_exists(str + "journalInfo.ini")) {
	flag = true;
}

//переносим в память информацию из файла
ini_open(str + "journalInfo.ini");
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
	//пока существует ключ под номером j в файле, я записываю строки из раздела в файле в раздел в массиве
	while (ini_key_exists(el, string(j))) {
		arr[j] = ini_read_string(el, string(j), "");
		j++;
	}
	//добавляю получившийся массив строк к словарю текстов в журнале, в данный раздел
	array_copy(ctrl_jrn_map_txt[?el], 0, arr, 0, array_length(arr));
	el = ds_map_find_next(ctrl_jrn_map_txt, el);
}
ini_close();

