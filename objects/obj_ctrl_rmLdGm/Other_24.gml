/// @description проверка на наличие сохранений

//игра создана впервые?
//var t = "saves/game_";
//если нет ни одной начатой игры
//if ((!directory_exists(t + "0")) and (!directory_exists(t + "1")) and (!directory_exists(t + "2")) and (!directory_exists(t + "3")) and (!directory_exists(t + "4"))) {	
if (file_find_first("saves/*", fa_directory) == "") {	
	//если сохранений нет, спрашиваем игрока, хочет ли он начать новую игру
	obj_ctrl_dlg.ctrl_dlg_need = true;
	obj_ctrl_dlg.type = "confirmYNCl";
	//если отвечает ,,да,, начинаем новую игру или выходим
	obj_ctrl_dlg.action = ["nothingSv", "back", "back"];
	instance_destroy();
}
file_find_close();

