/// @description выполнение действия

switch (action) {
	case "open": 
		destination = "pre_room";
		image_speed = 1;
		scr_snd_requestPlaySnd(sound[0], sound[1], sound[1], true);	// звук открытия
	break;
	case "close":
		destination = "next_room";
		image_speed = -1;
		scr_snd_requestPlaySnd(sound[0], sound[2], sound[2], true);	// звук закрытия
	break;
	// переход в заданную комнату
	case "goTo":
		image_speed = 1;
		scr_snd_requestPlaySnd(sound[0], sound[1], sound[1], true);	// звук открытия
	break;
}
