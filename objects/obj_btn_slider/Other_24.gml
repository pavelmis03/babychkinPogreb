/// @description конечные действия кнопки


switch (action) {
	//НАСТРОЙКИ
	case "sound_val":
		//говорим об изменении настроек звука
		obj_ctrl_set.action = "soundValChange";
		obj_ctrl_set.iid = id;
	break;
	case "music_val":
		//говорим об изменении настроек звука
		obj_ctrl_set.action = "musicValChange";
		obj_ctrl_set.iid = id;
	break;
}