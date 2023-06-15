/// @description перелистывание страниц и разделов 

//
if (sprite_index != spr_sys_none) {
	//если было перелистывание страниц
	if (sprite_index == spr_journal_pages) {
		//проверяем, что раздел назначение не равен текущему разделу
		if (ctrl_jrn_chapter_curr != ctrl_jrn_chapter_target) {
			//определяем, в какую сторону листать
			if (ctrl_jrn_chapter_curr < ctrl_jrn_chapter_target) {
				ctrl_jrn_chapter_curr++;
			} else {
				ctrl_jrn_chapter_curr--;
			}
			//определяю название текущего раздела
			var t = ["history", "quest", "monsterInfo", "weaponInfo", "achiv"];
			ctrl_jrn_btn_active = t[ctrl_jrn_chapter_curr - 1];
			//если перелистывание вперед (иначе, при перелистывании назад, это все делается еще в скрипте вызыва перелистывания)
			if ((image_speed != 1) or (ctrl_jrn_chapter_curr != ctrl_jrn_chapter_target)) {
				//назначаем спрайт перелистывания страница с закладкой
				sprite_index = asset_get_index("spr_journal_page" + string(ctrl_jrn_chapter_curr));
				//воспроизводим звук страницы
				obj_ctrl_snd.action = "playSnd";
				array_push(obj_ctrl_snd.sound, 20, "snd_menu_journalPage");
				image_index = image_number - 0.1;
				//скрываю перелистываемую закладку
				var t = ctrl_jrn_map_btn[?ctrl_jrn_btn_active];
				t[0].visible = false;
			}
			//завершение действия (если мы листаем назад и последним было перелистывание)
			if ((ctrl_jrn_chapter_curr == ctrl_jrn_chapter_target) and (image_speed == 1)) {
				//действия после перелистывания
				scr_change_chapter_end();
				//меняю фон на следующий (предыдущий)
				draw_spr = asset_get_index("spr_journal" + string(ctrl_jrn_chapter_curr));
			}
		}
	} else { //если перелистнулась одна страница или страница с закладкой
		//страница с закладкой
		if (sprite_index != spr_journal_page) {
			//id закладки
			var t = ctrl_jrn_map_btn[?ctrl_jrn_btn_active];
			t[0].visible = true;
			//перемещаю закладку на нужное место
			if (image_speed == -1) {
				t[0].x = room_width * 0.2;
			} else {
				t[0].x = room_width * 0.24 - sprite_get_bbox_left(spr_journal1) + sprite_get_bbox_right(spr_journal1);
			}
			//меняю фон на следующий (предыдущий)
			draw_spr = asset_get_index("spr_journal" + string(ctrl_jrn_chapter_curr));
			//если не добрались до целевого раздела, повторяем все с начала
			if (ctrl_jrn_chapter_curr != ctrl_jrn_chapter_target) {
				//снова перелистываю страницы
				sprite_index = spr_journal_pages;
				//воспроизводим звук страниц
				obj_ctrl_snd.action = "playSnd";
				array_push(obj_ctrl_snd.sound, 20, "snd_menu_journalPages");
			} else {
				//действия после перелистывания
				scr_change_chapter_end();
				//определяю название текущего раздела
				var t = ["history", "quest", "monsterInfo", "weaponInfo", "achiv"];
				ctrl_jrn_btn_active = t[ctrl_jrn_chapter_curr - 1];
			}
		} else { //если перелистнули одну страницу
			//действия после перелистывания
			scr_change_chapter_end();
		}
	}
}