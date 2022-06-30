/// @function scr_snd_musicInRm();
/// @param {} 
/// @description запускает и останавливает музыку в разных комнатах
function scr_snd_musicInRm() {
	var rm_name = room_get_name(room);
	
	//останавливаю активированную музыку
	audio_pause_all();
	
	//АКТИВАЦИЯ МУЗЫКИ
		//если в комнате вообще есть музыка
	if (ds_map_exists(ctrl_msc_map, rm_name)) {
		//копирую массив музыки для данной комнаты (с единицы потому, что 0ая ячейка хранит приоритет)
		var t_arr = [];	//массив музыки, которую надо воспроизвести 
		var t_arr1 = ctrl_msc_map[?rm_name];
		array_copy(t_arr, 0, t_arr1, 1, array_length(t_arr1));
		//приоритет музыки хранится первым значением
		var priority = t_arr1[0];
		var i = 0;
		//чтобы музыка не начиналась с начала при переходе в новую комнату,
		//я музыки останавливаю (выше), а потом запускаю в новой комнате те из них,
		//которые совпадают с музыкой из пред. комнаты 
			//убираю несовпадающие эл-ты, снимаю с паузы одинаковые 
		while (i < array_length(ctrl_msc_arr_on)) {
			var t_msc = audio_get_name(ctrl_msc_arr_on[i]);
			var ind = scr_arr_fingEl(t_arr, t_msc, 1);
			if (ind != -1) {
				//audio_resume_sound(asset_get_index(t_msc));
				array_delete(t_arr, ind, 1);
			} else {
				audio_stop_sound(ctrl_msc_arr_on[i]);
				array_delete(ctrl_msc_arr_on, i, 1);
				i--;
			}
			i++;
		}
		//проигрываем все оставшиеся звуки и запускаем неудаленную музыку
		audio_resume_all();
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
	//ПРОИГРЫВАНИЕ ЗВУКОВ
		//если в массиве есть элементы и этот массив не шаблон (см. create в объекте кнопки)
	if ((array_length(sound) > 1) and (sound[0] != -1)) {
		//приоритет звуков хранится первым значением
		var priority = sound[0];
		//удаляю приоритет
		array_delete(sound, 0, 1);
		for (var i = 0; i < array_length(sound); i++) {
			var t_msc = asset_get_index(sound[i]);
			//если звук еще не воспроизводится
			if (!audio_is_playing(t_msc)) {
				audio_sound_gain(t_msc, ctrl_snd_vol, 0);
				audio_play_sound(t_msc, priority, 0);
				//добавляем в массив играющейся музыки
				//!array_push(ctrl_snd_arr_on, t_msc);
			}
		}
	}
	//очищаю массив
	sound = [];
}