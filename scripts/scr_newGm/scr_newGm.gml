/// @function scr_newGm();
/// @param {}
/// @description удаляет файлы игры и создает их заново, заполняя данными по умолчанию, 
				//сообщает контроллеру игры, что начата новая игра

function scr_newGm() {
	//работа с сохранениями
	var i = 0;
	//с началом новой игры создается директория игры
	while (directory_exists("saves/game_" + string(i))) {
		ini_open("saves/game_" + string(i) + "/save_cmn.ini");
		//если в папке не было сделано сохранений
		if (ini_read_real("SAVES", "save_number", 0) == 0) {
			directory_destroy("saves/game_" + string(i));	//удаляем всю папку игры
			i--;
		}
		ini_close();
		i++; 
	}
	
	//папка игры
	var game_path = "saves/game_" + string(i);
	directory_create(game_path);
	
	//папка скриншотов игры
	//directory_create("saves/game_" + string(i) + "/save_screenshots/");

	//говорим, что загрузки не было
	obj_ctrl_gm_sv.ctrl_sv_ldDir = "newGm";
	obj_ctrl_gm_sv.ctrl_sv_gmDir = game_path;
	//указываем для статитстики путь созданной игры
	obj_ctrl_stat.ctrl_stat_path = game_path + "/statistic.ini";
	
	//создаю общие данные по сохранениям
	ini_open(game_path + "/save_cmn.ini");
	//данные для истории (номер просмотра)
	ini_write_real("HISTORY", "history_number", 0);
	//данные для диалогов (номер просмотра)
	ini_write_real("DIALOG", "dialog_number", 0);
	//данные по сохранениям (количество)
	ini_write_real("SAVES", "save_number", 0);
	//список сохранение - дата
	//ini_write_real("SAVES_DATE", "", 0);	//автоматически создастся при первом сохранении
	ini_close();
	
	//создаю файлы статистики и журнала
	//ini_open(game_path + "/statistic.ini");
	//ini_write_real("T", "t", 0);
	//ini_close();
	//ini_open(game_path + "/journalInfo.ini");
	//ini_write_real("T", "t", 0);
	//ini_close();
	
	//сообщаем объекту контроллера игры, что пора начинать новую игру
	obj_ctrl_gm.action = "startNewGm";
	obj_ctrl_mv.action = "addRm";
	//отправляемся в комнату псевдо загрузки
	room_goto(rm_menu_newGm_start);
}