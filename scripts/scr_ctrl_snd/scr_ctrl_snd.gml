/// @function scr_snd_musicInRm();
/// @param {} 
/// @description запускает и останавливает музыку в разных комнатах
function scr_snd_musicInRm() {
	
	//ПРИМЕРЫ словарей, с которыми работает скрипт
	//ctrl_msc_map[?"rm_menu_mm"] = [50, "msc_menu_mm1", "msc_menu_mm2"];	//случай 1 (надо проиграть все дорожки)
	//ctrl_msc_map[?"rm_gm_fp_elevator"] = [50, ["msc_gm_lift1", "msc_gm_lift2"]];	//случай 2 (надо проиграть одну из дорожек)

	randomize();

	var rm_name = room_get_name(room);
	
	//останавливаю активированную музыку
	audio_pause_all();
	
	//АКТИВАЦИЯ МУЗЫКИ
		//если в словаре задана музыка по комнате
	if (ds_map_exists(ctrl_msc_map, rm_name)) {
		//массив музыки и приоритета
		var t_arr = [];
		array_copy(t_arr, 0, ctrl_msc_map[?rm_name], 0, array_length(ctrl_msc_map[?rm_name]));
		//приоритет музыки хранится первым значением
		var priority = t_arr[0];
		//удаляю приоритет
		array_delete(t_arr, 0, 1);
		//если имеем второй случай (см. пример)
		if (is_array(t_arr[0])) {
			//выбираем один из треков
			var ti = irandom_range(0, array_length(t_arr[0]) - 1);
			//теперь массив состоит из одного элемента
			t_arr[0] = t_arr[0][ti];
		}
		var i = 0;
		//чтобы музыка не начиналась с начала при переходе в новую комнату,
		//останавливаю всю игравшую музыку (выше), а потом запускаю в новой комнате те из них,
		//которые совпадают с музыкой из пред. комнаты 
			//убираю несовпадающие эл-ты, снимаю с паузы одинаковые 
		while (i < array_length(ctrl_msc_arr_on)) {
			var t_msc = audio_get_name(ctrl_msc_arr_on[i]);
			//проверяю, что играющая сейчас музыка есть в массиве тех, которые надо запустить
			var ind = scr_arr_fingEl(t_arr, t_msc, 1);
			if (ind != -1) {
				audio_resume_sound(asset_get_index(t_msc));
				//удаляю ее из массива тех, что надо запустить, чтобы не было дубляжа 
				array_delete(t_arr, ind, 1);
			} else {
				//иначе останавливаю и удаляю из массива играющихся
				audio_stop_sound(ctrl_msc_arr_on[i]);
				array_delete(ctrl_msc_arr_on, i, 1);
				i--;
			}
			i++;
		}
		//проигрываем все оставшиеся звуки и запускаем неудаленную музыку
		//audio_resume_all();
		
		//запускаю новые, которых не было в пред. комнате
		for (var i = 0; i < array_length(t_arr); i++) {
			var t_msc = asset_get_index(t_arr[i]);
			audio_play_sound(t_msc, priority, 1);
			audio_sound_gain(t_msc, ctrl_msc_vol, 0);
			//добавляем в массив играющейся музыки
			array_push(ctrl_msc_arr_on, t_msc);
		}
	}
}



/// @function scr_snd_playSnd();
/// @param {} 
/// @description проигрывает переданный набор звуков
function scr_snd_playSnd() {
	
	//ПРИМЕРЫ массивов, с которыми работает скрипт
	//sound = [20, "snd_gm_lift_close", "snd_gm_lift_open"];	//случай 1 (надо проиграть все дорожки)
	//sound = [20, ["snd_gm_lift_angryWomen1", "snd_gm_lift_angryWomen2"...]];	//случай 2 (надо проиграть одну из дорожек)

	randomize();
	
	//ПРОИГРЫВАНИЕ ЗВУКОВ
		//если в массиве есть элементы и этот массив не шаблон (см. create в объекте кнопки)
	if ((array_length(sound) > 1) and (sound[0] != -1)) {
		//приоритет звуков хранится первым значением
		var priority = sound[0];
		//удаляю приоритет
		array_delete(sound, 0, 1);
		//воспроизвожу звуки
		for (var i = 0; i < array_length(sound); i++) {
			//если имеем второй случай (см. пример)
			if (is_array(sound[i])) {
				//выбираем один из треков
				var ti = irandom_range(0, array_length(sound[i]) - 1);
				//теперь массив состоит из одного элемента
				sound[i] = sound[i][ti];
			}
			var t_msc = asset_get_index(sound[i]);
			//если звук еще не воспроизводится
			if (!audio_is_playing(t_msc)) {
				audio_sound_gain(t_msc, ctrl_snd_vol, 0);
				audio_play_sound(t_msc, priority, 0);
				//добавляем в массив проигрываемых звуков
				//array_push(ctrl_snd_arr_on, t_msc);
			} else { //или остановлен
				if (audio_is_paused(t_msc)) {
					audio_resume_sound(t_msc);
				}
			}
		}
	}
	//очищаю массив
	sound = [];
}