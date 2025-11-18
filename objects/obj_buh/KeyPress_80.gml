/// @description завести (ключ зажигания)
randomize();
if (buh_playerIn) {	// если игрок внутри
	if (buh_startTurn < 3) {	// если мы еще не пытались завести
		if (buh_status == 0) {	// если буханка не заведена
			if (!audio_is_playing(snd_buh_starter)) {	// попробовать еще раз можно, когда звук доиграл
				if (irandom_range(1, 100) <= 20) {	// если нам повезло и она завелась	// !D
				// if (true) {	
					sprite_index = spr_buh_stateStarted;
					buh_status = 1;	// завелись
					buh_startTurn = 0;	// завелись! больше это не нужно до следующего раза
					scr_snd_requestPlaySnd(20, "snd_buh_startSuccess", "snd_buh_startSuccess", true);	// звук 
				} else {	// считаем неудачи
					buh_startTurn++;
					scr_snd_requestPlaySnd(20, "snd_buh_starter", "snd_buh_starter",  true);	// звук 
				}
			}
		}
	} else {
		buh_status = 2;	// заглохли
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaStalled";	
	}
}