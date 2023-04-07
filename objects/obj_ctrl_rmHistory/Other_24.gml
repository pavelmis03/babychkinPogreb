/// @description проверка наличия сохранений и выгрузка данных 

/*
//переносим в память информацию из файла
ini_open(obj_ctrl_gm_sv.ctrl_sv_gmDir + "/save_cmn.ini");
//количество просмотров истории (по нему ориентируюсь какой промежуток выбирать)
var t = ini_read_real("HISTORY", "history_number", 0);
if (obj_ctrl_gm.ctrl_gm_histStatus == 2) {
	t = ini_read_real("DIALOG", "dialog_number", 0);	
}
*/

//индекс диалога (или истории) (например "1_1", "2_4")
var ind = obj_ctrl_gm.ctrl_gm_historyInd;
//получаю границы промежутка 
var t2 = ctrl_history_map_[?ind];
//загружаю интервал, в котором можно смотреть историю 
ctrl_history_page_first = t2[0];
ctrl_history_page_curr = ctrl_history_page_first;
ctrl_history_page_last = t2[1];

//отмечаю историю или диалог, как прочитанные
ini_open(obj_ctrl_gm_sv.ctrl_sv_gmDir + "/save_cmn.ini");
//если диалоги
if (obj_ctrl_gm.ctrl_gm_histStatus == 2) {	//помечаю диалог (историю), как просмотренную
	ini_write_real("DIALOG", "dlg" + ind, 1);
} else {	//если история
	ini_write_real("HISTORY", "history" + ind, 1);
}
ini_close();

//обнуляем идентификатор истории (диалога) (например "1_1", "2_4")
obj_ctrl_gm.ctrl_gm_historyInd = "";
