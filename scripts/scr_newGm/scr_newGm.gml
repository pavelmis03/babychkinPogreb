/// @function scr_newGm();
/// @param {}
/// @description удаляет файлы игры и создает их заново, заполняя данными по умолчанию, 
				//сообщает контроллеру игры, что начата новая игра

function scr_newGm() {
	//игра создана впервые?
	if (!directory_exists("saves")) {
		directory_create("saves");
	}
	//пересоздаю или затираю данные, не важно
	//общие данные
	ini_open("saves\\save_cmn.ini");
	//данные для истории (номер просмотра)
	ini_write_real("HISTORY", "history_number", 0);
	//данные для диалогов (номер просмотра)
	ini_write_real("DIALOG", "dialog_number", 0);
	ini_close();
	
	//сообщаем объекту контроллера игры, что пора начинать новую игру
	obj_ctrl_gm.action = "startNewGm";
	//отправляемся в комнату псевдо загрузки
	room_goto(rm_menu_newGm_start);
}