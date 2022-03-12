/// @description выполнение действий

switch (action) {
	//выключает все звуки 
	case "soundChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение на противоположное (было on, стало off и наоборот)
		ctrl_set_map_curr[?"sound"] = !bool(ctrl_set_map_curr[?"sound"]);
		//сообщаем об изменении настроек звука
		obj_ctrl_snd.action = "sndChange";
	break;
	//выключает всю музыку
	case "musicChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение на противоположное (было on, стало off и наоборот)
		ctrl_set_map_curr[?"music"] = !bool(ctrl_set_map_curr[?"music"]);
		//сообщаем об изменении настроек звука
		obj_ctrl_snd.action = "sndChange";
	break;
	//меняет громкость звуков
	case "soundValChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение громкости музыки
		ctrl_set_map_curr[?"sound_val"] = iid.val;
		//сообщаем об изменении настроек звука
		obj_ctrl_snd.action = "sndChange";
	break;
	//меняет громкость музыки
	case "musicValChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение громкости звуков
		ctrl_set_map_curr[?"music_val"] = iid.val;
		//сообщаем об изменении настроек звука
		obj_ctrl_snd.action = "sndChange";
	break;
	//сохранить измененные настройки перед выходом в главное меню
	case "saveSettings":
		//здесь не надо сообщать об изменениях, ибо они уже применены, нужно только подтвердить 
		//здесь не нужно обнулять флаг изменения настроек, он обнулится в user event
		event_user(14);
		//сохраняем настройки 
		ds_map_copy(ctrl_set_map_pre, ctrl_set_map_curr);
	break;
	//удалить измененные настройки перед выходом в главное меню
	case "backDelSettings":
		//при выходе из меню настроек обнуляем флаг изменений для следующего раза
		ctrl_set_change = false;
		//отменяем изменения (откатываемся до предыдущих настроек)
		ds_map_copy(ctrl_set_map_curr, ctrl_set_map_pre);
		//сообщаем об изменении настроек звука
		obj_ctrl_snd.action = "sndChange";
	break;
	//откатить до настроек по умолчанию
	case "defaultSettings":
		//показываем, что настройки изменились 
		ctrl_set_change = true;
		//отменяем изменения (откатываемся до предыдущих настроек)
		ds_map_copy(ctrl_set_map_curr, ctrl_set_map_def);
		//сообщаем об изменении настроек звука
		obj_ctrl_snd.action = "sndChange";
		
		//костыль, наверное: обновление спрайтов кнопкам настроек:
		//ползунок положение 
		obj_btn_slider.x = obj_btn_slider.btn_slider_left_x +
							real(obj_ctrl_set.ctrl_set_map_curr[?obj_btn_slider.action])
							- sprite_get_width(spr_btn_other_slider1) / 2;
		obj_btn_slider.val = real(obj_ctrl_set.ctrl_set_map_curr[?obj_btn_slider.action]);
		//checkBtn вкл/выкл
		obj_btn_check.btn_pressed = bool(obj_ctrl_set.ctrl_set_map_curr[?obj_btn_check.action]);
		obj_btn_check.image_index = obj_btn_check.btn_pressed;
	break;
	//выключает эффекты в игре
	case "effectsChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение на противоположное (было on, стало off и наоборот)
		ctrl_set_map_curr[?"effects"] = !bool(ctrl_set_map_curr[?"effects"]);
	break;
	//выключает подсказки в игре
	case "hintsChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение на противоположное (было on, стало off и наоборот)
		ctrl_set_map_curr[?"hints"] = !bool(ctrl_set_map_curr[?"hints"]);
	break;
	//выключает заполнение экрана пикселями 
	case "pixelsChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение на противоположное (было on, стало off и наоборот)
		ctrl_set_map_curr[?"pixels"] = !bool(ctrl_set_map_curr[?"pixels"]);
	break;
	//меняет управление буханкой
	case "buhankaMvJLChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение на противоположное (было on, стало off и наоборот)
		ctrl_set_map_curr[?"buhankaMvJL"] = !bool(ctrl_set_map_curr[?"buhankaMvJL"]);
	break;
	//меняет тип движения игрока с обычного на сеточный
	case "gridMvChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение на противоположное (было on, стало off и наоборот)
		ctrl_set_map_curr[?"gridMv"] = !bool(ctrl_set_map_curr[?"gridMv"]);
	break;
	//уровень сложности
	case "difficultyLvlChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение сложности
		ctrl_set_map_curr[?"difficultyLvl"] = iid.draw_txt;
	break;
	//режим экрана
	case "screenModeChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение режима
		ctrl_set_map_curr[?"screenMode"] = iid.draw_txt;
		obj_ctrl_camera.action = "cameraChange";
	break;
	//разрешение экрана
	case "screenResolutionChange":
		//сообщаем об изменении настроек
		ctrl_set_change = true;
		//меняем значение разрешения
		ctrl_set_map_curr[?"screenResolution"] = iid.draw_txt;
		obj_ctrl_camera.action = "cameraChange";
	break;
}
