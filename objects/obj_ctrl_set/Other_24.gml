/// @description проверка файла настроек и загрузка 
//проверяет наличие файла, если существует, читает из него данные, если нет, создает, а потом читает


var flag = false;
//произойдет запись файла, если его не существует
if (!file_exists("setting.ini")) {
	flag = true;
}

//переносим в память настройки из файла
ini_open("setting.ini");
//ориентируемся по ключам в настройках, причем их порядок неважен 
var el = ds_map_find_first(ctrl_set_map_def);
//переписываем настройки из файла
for (var i = 0; i < ds_map_size(ctrl_set_map_def); i++) {
	if (flag) {	//если файла не существует, создаем его с настройками по умолчанию 
		ini_write_string("SETTINGS", el, ctrl_set_map_def[?el]);
	}
	//если игрок только что поменял настройки, надо их записать 
	if (ctrl_set_change) {
		ini_write_string("SETTINGS", el, ctrl_set_map_curr[?el]);
	} else { //если игра только началась и считать надо из файла
		//массивы настроек, использующиеся во время игры 
		ctrl_set_map_curr[?el] = ini_read_string("SETTINGS", el, ctrl_set_map_def[?el]);
		ctrl_set_map_pre[?el] = ctrl_set_map_curr[?el];
	}
	el = ds_map_find_next(ctrl_set_map_def, el);
}
ini_close();

//если игрок сохранил настройки, они запишутся в файл,
//а только потом можно будет считать, что изменений не было 
ctrl_set_change = false;