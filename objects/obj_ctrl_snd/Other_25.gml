/// @description выполнение действий

switch (action) {
	//проигрывание музыки при смене комнаты
	case "changeRm":
		scr_snd_musicInRm();
	break;
	//проигрывает набор переданных звуков
	case "playSnd":
		scr_snd_playSnd();
	break;
	//изменение настроек звуков и музыки
	case "sndChange":
		ctrl_snd_vol = real(obj_ctrl_set.ctrl_set_map_curr[?"sound_val"] / 100);	//громкость музыки и звуков
		ctrl_msc_vol = real(obj_ctrl_set.ctrl_set_map_curr[?"music_val"] / 100);
		if (!bool(obj_ctrl_set.ctrl_set_map_curr[?"sound"])) {
			ctrl_snd_vol = 0;	//если звуки вообще выключены, громкость на ноль
		}
		if (!bool(obj_ctrl_set.ctrl_set_map_curr[?"music"])) {
			ctrl_msc_vol = 0;	//если звуки вообще выключены, громкость на ноль
		}
		//изменяю громкость всей музыки 
		for (var i = 0; i < array_length(ctrl_msc_arr_on); i++) {
			audio_sound_gain(ctrl_msc_arr_on[i][0], ctrl_msc_vol, 0);
		}
		//изменяю громкость всех звуков
		for (var i = 0; i < array_length(ctrl_snd_arr_on); i++) {
			audio_sound_gain(ctrl_snd_arr_on[i][0], ctrl_snd_vol, 0);
		}
	break;
	//очистка звуков при начале новой игры и выходе из игры
	case "sndClear":
		//останавливаем все звуки
		for (var i = 0; i < array_length(ctrl_snd_arr_on); i++) {
			audio_stop_sound(ctrl_snd_arr_on[i][0]);
		}
		ctrl_snd_arr_on = [];
	break;
}