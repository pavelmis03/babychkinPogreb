/// @function scr_col_checkColObj(objType);
/// @param {} objType какие это объекты ("enemy", "player", "buh"...)
/// @description проверяет, если ли коллизия с кем-нибудь из указанных объектов
function scr_col_checkColObj(objType) {
	if (objType == "player") {	//проверяем коллизии с игроками
		var player_obj = scr_player_type();	//игрок в комнате
	
		if (place_meeting(x, y, player_obj)) {	//если, стоя в наших в наших координатах, мы имеем коллизию с игроком
			return player_obj;
		}	
	}
	
	if (objType == "buh") {	//проверяем коллизии с буханкой
		if (place_meeting(x, y, obj_buh)) {	//если, стоя в наших в наших координатах, мы имеем коллизию с буханкой
			return obj_buh;
		}	
	}
	
	if (objType == "enemy") {	//проверяем коллизии с игроками
		//получаем массив монстров откуда-нибудь
		//смотрим, есть ли контакт с кем-то из них
		//возвращаем id
	}
	
	
	return -1;
}