/// @description выполнение действия

switch (action) {
	case "open": 
		destination = "pre_room";
		image_speed = 1;
		scr_snd_requestPlaySnd(asset_get_index(sound[1]), asset_get_index(sound[1]), sound[0], true);	//звук открытия
	break;
	case "close":
		destination = "next_room";
		image_speed = -1;
		scr_snd_requestPlaySnd(asset_get_index(sound[2]), asset_get_index(sound[2]), sound[0], true);	//звук закрытия
	break;
	//переход в заданную комнату
	case "goTo":
		image_speed = 1;
		scr_snd_requestPlaySnd(asset_get_index(sound[1]), asset_get_index(sound[1]), sound[0], true);	//звук открытия
	break;
}