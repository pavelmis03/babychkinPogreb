/// @description завести (ключ зажигания)
randomize();
if (buh_playerIn) {	//если игрок внутри
	if (buh_startTurn < 3) {	//если мы еще не пытались завести
		if (buh_status == 0) {	//если буханка не заведена
			if (!audio_is_playing(snd_buh_starter)) {	//попробовать еще раз можно, когда звук доиграл
				//if (irandom_range(1, 100) <= 25) {	//если нам повезло и она завелась	//!D
				if (true) {	
					sprite_index = spr_buh_stateStarted;
					buh_status = 1;	//завелись
					buh_startTurn = 0;	//завелись! больше это не нужно до следующего раза
					//воспроизводим звук
					obj_ctrl_snd.action = "playSnd";
					array_push(obj_ctrl_snd.sound, 20, "snd_buh_startSuccess");
				} else {	//считаем неудачи
					buh_startTurn++;
					//воспроизводим звук
					obj_ctrl_snd.action = "playSnd";
					array_push(obj_ctrl_snd.sound, 20, "snd_buh_starter");
				}
			}
		}
	} else {
		buh_status = 2;	//заглохли
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaStalled";	
	}
}