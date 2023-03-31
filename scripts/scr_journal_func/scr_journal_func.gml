/// @function scr_change_chapter(target_chp, target_chp_num);
/// @param {} target_chp название раздела, в который мы перемещаемся
/// @param {} target_chp_num номер раздела, в который мы перемещаемся
/// @description меняет раздел в книге (меню информации): изменяет переменные, связанные с разделами
function scr_change_chapter(target_chp, target_chp_num) {
	//если кто-то захочет перелистнуть в открытый раздел 
	if (ctrl_jrn_btn_active != target_chp) {
		//параметры текущего раздела
		var t = ctrl_jrn_map_btn[?ctrl_jrn_btn_active];
		//параметры целевого раздела
		var t2 = ctrl_jrn_map_btn[?target_chp];
		//меняем флаг активации разделов
		t[1] = false;
		t2[1] = true;
		//обновляем данные по разделам 
		array_copy(ctrl_jrn_map_btn[?ctrl_jrn_btn_active], 0, t, 0, array_length(t));
		array_copy(ctrl_jrn_map_btn[?target_chp], 0, t2, 0, array_length(t2));
		//назначаем активным раздел цели 
		//ctrl_jrn_btn_active = target_chp;
		//номер раздела 
		ctrl_jrn_chapter_target = target_chp_num;
		if (ctrl_jrn_chapter_curr < ctrl_jrn_chapter_target) {
			image_speed = -1;
			sprite_index = spr_journal_pages;
			image_index = image_number - 0.1;
		} else {
			//назначаем спрайт перелистывания страница с закладкой
			sprite_index = asset_get_index("spr_journal_page" + string(ctrl_jrn_chapter_curr));
			image_index = 0;
			image_speed = 1;
			//скрываю перелистываемую закладку
			var t = ctrl_jrn_map_btn[?ctrl_jrn_btn_active];
			t[0].visible = false;
		}
		//стрелочки на страницах не должны существовать во время перелистывания
		instance_destroy(ctrl_jrn_btn_arrow_arr[0]);
		instance_destroy(ctrl_jrn_btn_arrow_arr[1]);
		//делаю кнопки неактивными
		obj_ctrl_dlg.ctrl_dlg_exist = true;
	}
}


/// @function scr_change_chapter_end();
/// @description создает стрелочки, меняет спрайт (нужен для сокращения одиакового когда)
function scr_change_chapter_end() {
	//создаю кнопки стрелочек после перелистывания страниц
	var obj = scr_btn_create(room_width * 0.7, room_height * 0.8, spr_btn_journal_next1, depth - 1, 0, "journalNext", "func", [20, "snd_none", "snd_none"]);
	ctrl_jrn_btn_arrow_arr[0] = obj;
	var obj = scr_btn_create(room_width * 0.33, room_height * 0.8, spr_btn_journal_pre1, depth - 1, 0, "journalPre", "func", [20, "snd_none", "snd_none"]);
	ctrl_jrn_btn_arrow_arr[1] = obj;
	sprite_index = spr_sys_none;
	image_speed = 0;
	//отмена некликабельности кнопок, которая активирована на время смены раздела 
	obj_ctrl_dlg.ctrl_dlg_exist = false;
}