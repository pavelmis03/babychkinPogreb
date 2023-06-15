/// @description проверяется нажатие кнопки взаимодействия игроком

//если персонаж в буханке
if (buh_playerIn) {
	//if (проверка на остановку, нейтраль, а также отсутствие препятствий по бокам)
	
	//создание игрока и тд
	
	//если мы выходим из буханки после окончания путешествия, а не потому что она не заводится
	if (buh_startTurn != 3) {
		buh_status = 0;
		//buh_startTurn = 0;
	}
	//спрайт стоянки
	sprite_index = spr_buh_getInCar;
	image_speed = -1;
	image_index = image_number - 0.1;
	
	buh_playerIn = false;
	interacting = false;
} else {
	//варианты взаимодействия 
	switch (can_interact) {
		case 1:
			//удаление или пересоздание игрока 
			obj_ctrl_camera.action = "changeView";
			//instance_destroy(player_obj);
		
			buh_playerIn = true;	//игрок внутри буханки
			//начинаем взаимодействие
			interacting = true;
			
			sprite_index = spr_buh_getInCar;
			image_index = 0;
			//воспроизводим звук
			obj_ctrl_snd.action = "playSnd";
			array_push(obj_ctrl_snd.sound, 20, "snd_buh_getInCar");
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaStart";	
		break;
		case 2:
			sprite_index = spr_buh_openTrunk;
			image_index = 0;
			//воспроизводим звук
			obj_ctrl_snd.action = "playSnd";
			array_push(obj_ctrl_snd.sound, 20, "snd_buh_openTrunk");
		break;
		case 3:
			sprite_index = spr_buh_mode;
			image_index = 0;
			//воспроизводим звук
			obj_ctrl_snd.action = "playSnd";
			array_push(obj_ctrl_snd.sound, 20, "snd_buh_mode");
		break;
	}
}