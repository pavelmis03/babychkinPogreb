/// @description 
//СДЕЛАТЬ СКРИПТ для одинакового кода!!!
//устанавливаю действия после проигрываиня опр. спрайтов
switch (sprite_index) {
	case spr_buh_openTrunk:	//спрайты открывания/закрывания багажника и капота для целой и сломанной машины
		scr_buh_aniEndFunc(spr_buh_openTrunk, snd_buh_openTrunk);
	break;
	case spr_buh_mode:
		scr_buh_aniEndFunc(spr_buh_mode, snd_buh_mode);
	break;
	case spr_buh_openTrunkBroke:
		scr_buh_aniEndFunc(spr_buh_openTrunkBroke, snd_buh_openTrunk);
	break;
	case spr_buh_modeBroke:
		scr_buh_aniEndFunc(spr_buh_modeBroke, snd_buh_mode);
	break;
	case spr_buh_getInCar:	//садимся/вылазим в целую буханку
		sprite_index = spr_buh_state;
		image_index = 0;
		if (image_speed == -1) {	//если мы вылазим из машины
			buh_playerIn = false;	
			
			//выкидываем персонажа из буханки
			player_obj.player_buhIn = false;	//сообщаем персонажу, что он покинул буханку
			player_obj.visible = true;
			player_obj.x = x + lengthdir_x(140, direction + 90);
			player_obj.y = y + lengthdir_y(140, direction + 90);
			
			scr_env_stopInteract()	//прекращаем взаимодействие с персонажем
		}
		image_speed = 1;
	break;
	case spr_buh_getInCarBroke:		//вылазим из разбитой буханку
		sprite_index = spr_buh_broke;
		image_index = 0;
		
		//сесть в сломанную нельзя, только вылезти, поэтому условие здесь
		buh_playerIn = false;	
			
		//выкидываем персонажа из буханки
		player_obj.player_buhIn = false;	//сообщаем персонажу, что он покинул буханку
		player_obj.visible = true;
		player_obj.x = x + lengthdir_x(140, direction + 90);
		player_obj.y = y + lengthdir_y(140, direction + 90);
			
		scr_env_stopInteract()	//прекращаем взаимодействие с персонажем
		
		image_speed = 1;
	break;
}
