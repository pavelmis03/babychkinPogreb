/// @description выполнение действия action

switch (action) {
	//когда игрок нажимает на журнал и тот открывается
	case "openJournal":
		//рисуем фон журнала
		visible = true;
		//создаю кнопки-закладки
		//все слагаемые и вычитаемые - константы для красивого положения кнопок
		var t1 = room_width * 0.24 - sprite_get_bbox_left(spr_journal1) + sprite_get_bbox_right(spr_journal1);
		var t2 = room_height * 0.36;
		var t3 = sprite_get_height(spr_btn_journal_history1) + 10;
		var obj = scr_btn_create(room_width * 0.2, t2, spr_btn_journal_history1, depth + 1, 0, "journalHistory", "func", [20, "snd_none", "snd_none"]);
		ds_map_add(ctrl_jrn_btn_map, "history", [obj, true, 1]);
		var obj = scr_btn_create(t1, t2 + t3, spr_btn_journal_quest1, depth + 1, 0, "journalQuest", "func", [20, "snd_none", "snd_none"]);
		ds_map_add(ctrl_jrn_btn_map, "quest", [obj, false, 1]);
		var obj = scr_btn_create(t1, t2 + t3 * 2, spr_btn_journal_monsterInfo1, depth + 1, 0, "journalMonsterInfo", "func", [20, "snd_none", "snd_none"]);
		ds_map_add(ctrl_jrn_btn_map, "monsterInfo", [obj, false, 1]);
		var obj = scr_btn_create(t1, t2 + t3 * 3, spr_btn_journal_weaponInfo1, depth + 1, 0, "journalWeaponInfo", "func", [20, "snd_none", "snd_none"]);
		ds_map_add(ctrl_jrn_btn_map, "weaponInfo", [obj, false, 1]);
		var obj = scr_btn_create(t1, t2 + t3 * 4, spr_btn_journal_achiv1, depth + 1, 0, "journalAchiv", "func", [20, "snd_none", "snd_none"]);
		ds_map_add(ctrl_jrn_btn_map, "achiv", [obj, false, 1]);
		//стрелочки страниц
		var obj = scr_btn_create(room_width * 0.65, room_height * 0.8, spr_btn_journal_next1, depth - 1, 0, "journalNext", "func", [20, "snd_none", "snd_none"]);
		//сохраняю стрелки, чтобы удалять их во время перелистывания 
		ctrl_jrn_btn_arrow_arr[0] = obj;
		var obj = scr_btn_create(room_width * 0.33, room_height * 0.8, spr_btn_journal_pre1, depth - 1, 0, "journalPre", "func", [20, "snd_none", "snd_none"]);
		ctrl_jrn_btn_arrow_arr[1] = obj;
		//подгружаем текст из файла
		event_user(14);
	break;  
	//перелистывание страницы раздела
	case "journalNext":
		//получаю текущую страницу и максимальное количество страниц
		var t = ctrl_jrn_btn_map[?ctrl_jrn_btn_active];
		var t2 = ctrl_jrn_txt_map[?ctrl_jrn_btn_active];
		//если страница не последняя
		if (t[2] + 2 <= ceil(array_length(t2) / ctrl_jrn_txt_str)) {
			t[2] += 2;	//у нас ведь разворот и перелистывается сразу две страницы
			//спрайт перелистывания страницы
			sprite_index = spr_journal_page;
			image_speed = 1;
			//стрелочки на страницах не должны существовать во время перелистывания
			instance_destroy(ctrl_jrn_btn_arrow_arr[0]);
			instance_destroy(ctrl_jrn_btn_arrow_arr[1]);
		}
		//переносим измененные данные (напрямую не позволяет движок)
		array_copy(ctrl_jrn_btn_map[?ctrl_jrn_btn_active], 0, t, 0, array_length(t));
	break;
	//перелистывание страницы раздела
	case "journalPre":
		//получаю текущую страницу и максимальное количество страниц
		var t = ctrl_jrn_btn_map[?ctrl_jrn_btn_active];
		var t2 = ctrl_jrn_txt_map[?ctrl_jrn_btn_active];
		//если страница не последняя
		if (t[2] - 2 >= 1) {
			t[2] -= 2;
			//спрайт перелистывания страницы
			sprite_index = spr_journal_page;
			image_index = image_number - 0.1;
			image_speed = -1;
			//стрелочки на страницах не должны существовать во время перелистывания
			instance_destroy(ctrl_jrn_btn_arrow_arr[0]);
			instance_destroy(ctrl_jrn_btn_arrow_arr[1]);
		}
		//переносим измененные данные (напрямую не позволяет движок)
		array_copy(ctrl_jrn_btn_map[?ctrl_jrn_btn_active], 0, t, 0, array_length(t));
	break;
	case "journalHistory":
		//переходим в раздел истории
		scr_change_chapter("history", 1);
	break;
	case "journalQuest":
		scr_change_chapter("quest", 2);
	break;
	case "journalMonsterInfo":
		scr_change_chapter("monsterInfo", 3);
	break;
	case "journalWeaponInfo":
		scr_change_chapter("weaponInfo", 4);
	break;
	case "journalAchiv":
		scr_change_chapter("achiv", 5);
	break;
}