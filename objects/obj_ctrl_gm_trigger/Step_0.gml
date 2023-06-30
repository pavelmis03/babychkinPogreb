/// @description 

var player_colObj = scr_col_checkColObj("player");	//определяем, есть ли коллизия с каким-то из игроков
var buh_colObj = scr_col_checkColObj("buh");	//определяем, есть ли коллизия с буханкой

if (!init) {
	event_user(0);
}

//проверка на коллизию с игроком в любом случае или с буханкой, если это триггер перемещения
if ((player_colObj != -1) or ((action == "moveToNextRm") and (buh_colObj != -1))) {
	//если триггер или метка по позиции
	if (string_copy(type, 0, 3) == "pos") {
		//выполнение действия
		if (action != "") {
			event_user(15);
		}
	}
}


	
	
	
	
	