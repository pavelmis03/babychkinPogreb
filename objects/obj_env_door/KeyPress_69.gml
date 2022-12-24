/// @description проверяется нажатие кнопки взаимодействия игроком

//если игрок поблизости и смотрит на дверь, 
if (can_interact) {
	switch (destination) {
		case "next_room": 
			action = "open";
		break;
		case "pre_room": 
			action = "close"; 
		break;
		default: 
			action = "goTo";	//если в destination название комнаты
	}
}
//остальные действия наследуются

// Inherit the parent event
event_inherited();

