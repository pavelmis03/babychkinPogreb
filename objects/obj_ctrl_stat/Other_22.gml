/// @description сохранение статистики

ini_open(ctrl_stat_path);
//ориентируемся по ключам, причем их порядок неважен 
var el = ds_map_find_first(ctrl_map_stat);
//записываем статистику в файла
for (var i = 0; i < ds_map_size(ctrl_map_stat); i++) {
	ini_write_string("STATISTIC", el, ctrl_map_stat[?el]);
	el = ds_map_find_next(ctrl_map_stat, el);
}
ini_close();
