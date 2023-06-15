/// @description 

//устанавливаю действия после проигрываиня опр. спрайтов
switch (sprite_index) {
	case spr_buh_openTrunk:
		sprite_index = spr_buh_state;
		image_index = 0;
	break;
	case spr_buh_mode:
		sprite_index = spr_buh_state;
		image_index = 0;
	break;
	case spr_buh_getInCar:
		sprite_index = spr_buh_state;
		image_index = 0;
	break;
}
image_speed = 1;
/*
ЭТО НАДО ДЕЛАТЬ ПОСЛЕ ВЫХОДА ИЗ БУХАНКИ

//если спрайт завершился после того, как было начато взаимодействие
if (interacting) {
	//если персонаж взаимодействует с нашим объектом
	if ((player_obj.player_map_col[?type] == 0) or (player_obj.player_map_col[?type] == id)) {
		//сообщаю персонажу, что действие закончено
		player_obj.player_pressE = false;
	}
	
	interacting = false;
	
	//в зависимости от предмета: либо возвращается статический спрайт, либо другой
}