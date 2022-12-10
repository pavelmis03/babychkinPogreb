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
	
	//спрайт взаимодействия
	var str = sprite_get_name(sprite_index);
	sprite_index = asset_get_index(string_copy(str, 0, string_length(str) - 1) + "2");
}
//остальные действия наследуются

// Inherit the parent event
event_inherited();

