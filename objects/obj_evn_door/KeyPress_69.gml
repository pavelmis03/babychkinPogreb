/// @description проверяется нажатие кнопки взаимодействия игроком

//если игрок поблизости и смотрит на дверь, 
if (can_interact) {
	//запускаем спрайт
	image_speed = 1;
	switch (destination) {
		case "next_room": action = "open"; break;
		case "pre_room": action = "close"; break;
		default: action = "goTo";	//если в destination название комнаты
	}
}