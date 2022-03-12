/// @description проверка наличия сохранений и выгрузка данных 

//переносим в память информацию из файла
ini_open("saves\\save_cmn.ini");
//количество просмотров истории (по нему ориентируюсь какой промежуток выбирать)
var t = ini_read_real("HISTORY", "history_number", 0);
if (obj_ctrl_gm.ctrl_gm_goDlg) {
	t = ini_read_real("DIALOG", "dialog_number", 0);
}
//получаю границы промежутка 
var t2 = ctrl_history_arr[int64(t)];
//загружаю интервал, в котором можно смотреть историю 
ctrl_history_page_first = t2[0];
ctrl_history_page_curr = ctrl_history_page_first;
ctrl_history_page_last = t2[1];

//если диалоги
if (obj_ctrl_gm.ctrl_gm_goDlg) {
	t = ini_write_real("DIALOG", "dialog_number", int64(t) + 1);
} else {
	//сохраняю количество просмотров историй, с учетом текущего просмотра 
	t = ini_write_real("HISTORY", "history_number", int64(t) + 1);
}
ini_close();

