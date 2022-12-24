/// @function scr_newGm();
/// @param {}
/// @description удаляет файлы игры и создает их заново, заполняя данными по умолчанию, 
				//сообщает контроллеру игры, что начата новая игра

function scr_newGm() {
	//работа с сохранениями
	var i = 0;
	//с началом новой игры создается директория игры
	while (directory_exists("saves/game_" + string(i))) {
		i++; 
	}
	
	//папка игры
	var game_path = "saves/game_" + string(i) + "/";
	directory_create(game_path);

	//говорим, что загрузки не было
	obj_ctrl_gm_sv.ctrl_sv_ldDir = "newGm";
	obj_ctrl_gm_sv.ctrl_sv_gmDir = game_path;
	
	//пересоздаю или затираю данные, не важно
	//общие данные
	ini_open(game_path + "save_cmn.ini");
	//данные для истории (номер просмотра)
	ini_write_real("HISTORY", "history_number", 0);
	//данные для диалогов (номер просмотра)
	ini_write_real("DIALOG", "dialog_number", 0);
	//данные по сохранениям
	ini_write_real("SAVES", "save_number", 0);
	ini_close();
	
	//сообщаем объекту контроллера игры, что пора начинать новую игру
	obj_ctrl_gm.action = "startNewGm";
	obj_ctrl_mv.action = "addRm";
	//отправляемся в комнату псевдо загрузки
	room_goto(rm_menu_newGm_start);
}