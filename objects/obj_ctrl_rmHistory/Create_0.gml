/// @description этот объект отвечает за некоторые действия, происходящие в комнате истории 
// ОН ЛОКАЛЬНЫЙ
//действия:
	//отрисовка слайда истории
	//перелистывание слайдов и т.д.

//main
action = "";

//drawing
draw_spr = spr_history;	//слайд истории
if (obj_ctrl_gm.ctrl_gm_goDlg) {
	draw_spr = spr_dlg;	//слайд диалога
}
//draw_txt_x = room_width * 0.31;	//начало рисования текста на книге
//draw_txt_y = room_height * 0.36;
ctrl_history_page_first = 0;	//первая
ctrl_history_page_curr = 0;		//текущая страница
ctrl_history_page_last = 2;		//последняя

//промежутки просмотра для комнаты истории
ctrl_history_arr[0] = [0, 2];
ctrl_history_arr[1] = [3, 4];
ctrl_history_arr[2] = [5, 6];
ctrl_history_arr[3] = [7, 8];
//для комнаты диалогов
if (obj_ctrl_gm.ctrl_gm_goDlg) {
	ctrl_history_arr[0] = [0, 1];
	ctrl_history_arr[1] = [2, 2];
	ctrl_history_arr[2] = [5, 6];
	ctrl_history_arr[3] = [7, 8];
}

//отрисовка фона-скриншота при выводе диалогов 
if (obj_ctrl_gm.ctrl_gm_goDlg) {
	obj_ctrl_gm_img.action = "drawTempScreenShot";
}

event_user(14);	//проверка на наличие сохранений, выгрузка их

//sys
x = -100000;

//настройка комнаты
//если слайдов больше одного
if (ctrl_history_page_last - ctrl_history_page_first > 0) {
	//кнопка ,,предыдущий слайд,,
	var obj = instance_create_depth(room_width * 0.19, room_height * 0.88, depth, obj_btn);
	obj.sprite_index = spr_btn_ref_pre1;
	obj.type = "func";
	obj.action = "historyPreImg";
	obj.sound = [20, "snd_menu_enterDoor", "snd_menu_openDoor"];
	//кнопка ,,следующий слайд,,
	var obj = instance_create_depth(room_width * 0.32, room_height * 0.88, depth, obj_btn);
	obj.sprite_index = spr_btn_ref_next1;
	obj.type = "func";
	obj.action = "historyNextImg";
	obj.sound = [20, "snd_menu_enterDoor", "snd_menu_openDoor"];
}
