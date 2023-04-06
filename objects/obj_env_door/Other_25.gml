/// @description выполнение действия

switch (action) {
	case "open": 
		destination = "pre_room";
		image_speed = 1;
		//воспроизводим звук открытия
		obj_ctrl_snd.action = "playSnd";
		array_push(obj_ctrl_snd.sound, sound[0], sound[1]);
	break;
	case "close":
		destination = "next_room";
		image_speed = -1;
		//воспроизводим звук закрытия
		obj_ctrl_snd.action = "playSnd";
		array_push(obj_ctrl_snd.sound, sound[0], sound[2]);
	break;
	//переход в заданную комнату
	case "goTo":
		image_speed = 1;
		//воспроизводим звук открытия
		obj_ctrl_snd.action = "playSnd";
		array_push(obj_ctrl_snd.sound, sound[0], sound[1]);
	break;
}