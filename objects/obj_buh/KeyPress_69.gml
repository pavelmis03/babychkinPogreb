/// @description проверяется нажатие кнопки взаимодействия игроком

//если сейчас мы стоим и ничего не делаем
if (scr_arr_fingEl([spr_buh_state, spr_buh_stateStarted], sprite_index, 1) != -1) {
	//если персонаж в буханке
	if (buh_playerIn) {
		//чтобы выйти из буханки, нужно остановитьс и поставить буханку на нейтраль и ручник
		if ((buh_handbrake) and (buh_transmission == 0)) {
			//если мы выходим из буханки после окончания путешествия, а не потому что она не заводится
			if (buh_startTurn != 3) {
				buh_status = 0;
				//buh_startTurn = 0;
			}
			//вылезания из машины
			sprite_index = spr_buh_getInCar;
			image_speed = -1;
			image_index = image_number - 0.1;	
			player_obj.player_buhIn = false;	//сообщаем персонажу, что он покинул буханку
			scr_snd_requestPlaySnd(snd_buh_getInCar, snd_buh_getInCar, 20, true);	//звук 
		} else {
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaCantLeave";	
		}
	} else {
		//варианты взаимодействия 
		switch (can_interact) {
			case 1:
				player_obj.visible = false;	//делаем игрока невидимым
				//на всякий: так направление персонажа ни с кем не совпадет и он не сможет взаимодействовать
				player_obj.image_angle = direction + 180;

				buh_playerIn = true;	//игрок внутри буханки
				player_obj.player_buhIn = true;	//сообщаем персонажу, а через него всем остальным, что мы в буханке
				//начинаем взаимодействие
				interacting = true;
			
				sprite_index = spr_buh_getInCar;
				image_index = 0;
				scr_snd_requestPlaySnd(snd_buh_getInCar, snd_buh_getInCar, 20, true);	//звук посадки в машину
				obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaStart";	
			break;
			case 2:
				sprite_index = spr_buh_openTrunk;
				image_index = 0;
				scr_snd_requestPlaySnd(snd_buh_openTrunk, snd_buh_openTrunk, 20, true);
				//начинаем взаимодействие
				interacting = true;
			break;
			case 3:
				sprite_index = spr_buh_mode;
				image_index = 0;
				scr_snd_requestPlaySnd(snd_buh_mode, snd_buh_mode, 20, true);	
				//начинаем взаимодействие
				interacting = true;
			break;
		}
	}
}