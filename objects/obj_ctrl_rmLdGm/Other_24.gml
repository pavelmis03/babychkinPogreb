/// @description 

//игра создана впервые?
var t = "saves/game_";
//если нет ни одного сохранения
//делать проверку на то, что папки сохранений пустые и удалять их
if ((!directory_exists(t + "0")) and (!directory_exists(t + "1")) and (!directory_exists(t + "2")) and (!directory_exists(t + "3")) and (!directory_exists(t + "4"))) {	
	//если сохранений нет, спрашиваем игрока, хочет ли он начать новую игру
	obj_ctrl_dlg.ctrl_dlg_need = true;
	obj_ctrl_dlg.type = "confirmYNCl";
	//если отвечает ,,да,, начинаем новую игру или выходим
	obj_ctrl_dlg.action = ["nothingSv", "back", "back"];
} else {
	//для получения информации о сохранении разбирать строку с помощью string_split(str, "splitter")
	//здесь нужно создавать по пять кнопок-загрузок, которым присваивать дату сохранения и название квеста
	
	
}

