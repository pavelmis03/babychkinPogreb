/// @description выполнение действия

switch (action) {
	case "open": 
		destination = "pre_room";
		image_speed = 1;
	break;
	case "close":
		destination = "next_room";
		image_speed = -1;
	break;
	//переход в заданную комнату
	case "goTo":
		
	break;
}