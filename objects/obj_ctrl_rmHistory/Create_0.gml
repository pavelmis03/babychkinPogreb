/// @description этот объект отвечает за некоторые действия, происходящие в комнате истории 
// ОН ЛОКАЛЬНЫЙ
//действия:
	//отрисовка слайда истории
	//перелистывание слайдов и т.д.

//main
action = "";

//drawing
draw_spr = spr_history;	//слайд истории
if (obj_ctrl_gm.ctrl_gm_histStatus == 2) {
	draw_spr = spr_dlg;	//слайд диалога
}
//draw_txt_x = room_width * 0.31;	//начало рисования текста на книге
//draw_txt_y = room_height * 0.36;
ctrl_history_page_first = 0;	//первая
ctrl_history_page_curr = 0;		//текущая страница
ctrl_history_page_last = 2;		//последняя

//промежутки просмотра для комнаты истории
ctrl_history_map_ = ds_map_create();
ctrl_history_map_[?"1_1"] = [0, 2];
ctrl_history_map_[?"1_2"] = [3, 4];
ctrl_history_map_[?"1_3"] = [5, 6];
ctrl_history_map_[?"1_4"] = [7, 8];
	
if (obj_ctrl_gm.ctrl_gm_histStatus == 2) {
	//для комнаты диалогов
	ctrl_history_map_[?"1_1"] = [0, 1];
	ctrl_history_map_[?"1_2"] = [2, 2];
	ctrl_history_map_[?"1_3"] = [3, 3];
	ctrl_history_map_[?"1_4"] = [4, 5];
}

//отрисовка фона-скриншота при выводе диалогов 
if (obj_ctrl_gm.ctrl_gm_histStatus == 2) {
	obj_ctrl_gm_img.action = "drawTempScreenShot";
}

event_user(14);	//проверка на наличие сохранений, выгрузка их

//sys
x = -100000;
depth = -100;



//настройка комнаты
btn_id1 = 0;	//id кнопок ,,вперед,, и ,,назад,,
btn_id2 = 0;

//создаю кнопки
//кнопка ,,Следующий слайд,,
btn_id1 = scr_btn_create(room_width * 0.32, room_height * 0.88, spr_btn_history_next1, depth, 0, "historyNextImg", "func", [20, "snd_none", "snd_none"]);
/*
btn_id1 = instance_create_depth(room_width * 0.32, room_height * 0.88, depth, obj_btn);
btn_id1.sprite_index = spr_btn_history_next1;
btn_id1.type = "func";
btn_id1.action = "historyNextImg";
btn_id1.sound = [20, "snd_menu_MMEnterDoor", "snd_menu_MMOpenDoor"];
btn_id1.btn_enable = true;
*/	
//кнопка ,,предыдущий слайд,,
btn_id2 = scr_btn_create(room_width * 0.19, room_height * 0.88, spr_btn_history_pre1, depth, 0, "historyPreImg", "func", [20, "snd_none", "snd_none"]);
/*
btn_id2 = instance_create_depth(room_width * 0.19, room_height * 0.88, depth, obj_btn);
btn_id2.sprite_index = spr_btn_history_pre1;
btn_id2.type = "func";
btn_id2.action = "historyPreImg";
btn_id2.sound = [20, "snd_menu_MMEnterDoor", "snd_menu_MMOpenDoor"];
*/
//листать назад незачем, т.к. это первый слайд в очереди
btn_id2.btn_enable = false;

//если слайд только один, деактивирую вторую кнопку
if (ctrl_history_page_last - ctrl_history_page_first == 0) {
	btn_id1.btn_enable = false;
}
