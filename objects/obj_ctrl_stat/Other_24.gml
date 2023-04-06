/// @description загрузка статистики
//проверяет наличие файла, если существует, читает из него данные, если нет, создает, а потом читает

var str = "";		//папка последней игры
//сначала пробую получить путь игры из контроллера сохранений (если мы играем прямо сейчас)
if (directory_exists(obj_ctrl_gm_sv.ctrl_sv_gmDir)) {
	str = obj_ctrl_gm_sv.ctrl_sv_gmDir + "/";
} else { 
	//если мы не играем, проверяю, сохранена ли он нас информация о последней игре
	if (file_exists("statistic.ini")) {
		ini_open("statistic.ini");
		//если да, то буду загружать информацию оттуда
		if (directory_exists(ini_read_string("GAMEINFO", "lastGame", "saves/game_0"))) {
			//если существует, добавляю разделительный слэш между путем игры и именем файла
			str = ini_read_string("GAMEINFO", "lastGame", "saves/game_0") + "/";	
		}	//иначе будем загружать информацию из корня папки GMS - инфа по умолчанию
		ini_close();
	}
}

var flag = false;
//произойдет запись файла, если его не существует
if (!file_exists(str + "statistic.ini")) {
	flag = true;
}

//переносим в память статистику из файла
ctrl_stat_path = str + "statistic.ini";	//путь до файла статистики
ini_open(str + "statistic.ini");
//ориентируемся по ключам, причем их порядок неважен 
var el = ds_map_find_first(ctrl_map_stat);
//переписываем статистику из файла
for (var i = 0; i < ds_map_size(ctrl_map_stat); i++) {
	if (flag) {	//если файла не существует, создаем его с настройками по умолчанию 
		ini_write_string("STATISTIC", el, ctrl_map_stat[?el]);
	}
	//если игра только началась и считать надо из файла
	ctrl_map_stat[?el] = ini_read_string("STATISTIC", el, ctrl_map_stat[?el]);
	el = ds_map_find_next(ctrl_map_stat, el);
}
ini_close();

event_user(13);	//обновление массива отрисовки в соответствии со статистикой

