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
ctrl_history_arr[2] = [5, 7];
ctrl_history_arr[3] = [8, 8];
//для комнаты диалогов
if (obj_ctrl_gm.ctrl_gm_goDlg) {
	ctrl_history_arr[0] = [0, 2];
	ctrl_history_arr[1] = [3, 4];
	ctrl_history_arr[2] = [5, 7];
	ctrl_history_arr[3] = [8, 8];
}

//отрисовка фона-скриншота при выводе диалогов 
if (obj_ctrl_gm.ctrl_gm_goDlg) {
	obj_ctrl_gm_img.action = "drawTempScreenShot";
}

event_user(14);	//проверка на наличие сохранений, выгрузка их

//sys
x = -100000;