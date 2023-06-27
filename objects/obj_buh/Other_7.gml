/// @description 
//СДЕЛАТЬ СКРИПТ для одинакового кода!!!
//устанавливаю действия после проигрываиня опр. спрайтов
switch (sprite_index) {
	case spr_buh_openTrunk:
		//переход в комнату инвентаря
		
		if (image_speed == -1) {	//если выходим из багажника
			scr_snd_requestPlaySnd(snd_buh_openTrunk, snd_buh_openTrunk, 20, true);	//звук 
			scr_env_stopInteract()	//прекращаем взаимодействие с персонажем
			//буханка теперь просто стоит
			sprite_index = spr_buh_state;
			image_index = 0;
			image_speed = 1;
		} else { // если только зашли в багажник
			//если открывали багажник, то попали в другую комнату, при выходе, проигрываем 
			//спрайт в другую сторону: закрываем багажник
			sprite_index = spr_buh_openTrunk;
			image_speed = -1;
			image_index = image_number - 0.1;
		}
	break;
	case spr_buh_mode:
		//переход в комнату инвентаря
		
		if (image_speed == -1) {	//если мы вылазим из машины
			scr_snd_requestPlaySnd(snd_buh_mode, snd_buh_mode, 20, true);	//звук 
			scr_env_stopInteract()	//прекращаем взаимодействие с персонажем
			sprite_index = spr_buh_state;
			image_index = 0;
			image_speed = 1;
		} else { 
			sprite_index = spr_buh_mode;
			image_speed = -1;
			image_index = image_number - 0.1;
		}
	break;
	case spr_buh_getInCar:
		sprite_index = spr_buh_state;
		image_index = 0;
		if (image_speed == -1) {	//если мы вылазим из машины
			buh_playerIn = false;
			
			//выкидываем персонажа из буханки
			player_obj.visible = true;
			player_obj.x = x + lengthdir_x(140, direction + 90);
			player_obj.y = y + lengthdir_y(140, direction + 90);
			
			scr_env_stopInteract()	//прекращаем взаимодействие с персонажем
		}
		image_speed = 1;
	break;
}
