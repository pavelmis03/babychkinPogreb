/// @description сохранение и загрузка статистики
//проверяет наличие файла, если существует, читает из него данные, если нет, создает, а потом читает

var flag = false;
//произойдет запись файла, если его не существует
if (!file_exists("statistic.ini")) {
	flag = true;
}

//переносим в память статистику из файла
ini_open("statistic.ini");
//ориентируемся по ключам, причем их порядок неважен 
var el = ds_map_find_first(ctrl_stat_map);
//переписываем статичтику из файла
for (var i = 0; i < ds_map_size(ctrl_stat_map); i++) {
	if (flag) {	//если файла не существует, создаем его с настройками по умолчанию 
		ini_write_string("STATISTIC", el, ctrl_stat_map[?el]);
	}
	//если игра только началась и считать надо из файла
	ctrl_stat_map[?el] = ini_read_string("STATISTIC", el, ctrl_stat_map[?el]);
	el = ds_map_find_next(ctrl_stat_map, el);
}
ini_close();

event_user(13);	//обновление массива отрисовки в соответствии со статистикой

