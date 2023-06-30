/// @description 

//объект игрока
player = scr_player_type();

if (!init) {
	event_user(0);
}

//проверка на переход в другую комнату
if (obj_ctrl_mv.pre_rm != room) {
	action = "changeRm";
} else {
	//если буханка существует, сохраняем ее состояние
	if (instance_exists(obj_buh)) {
		buh_map_info[?"x"] = obj_buh.x;
		buh_map_info[?"y"] = obj_buh.y;
		buh_map_info[?"depth"] = obj_buh.depth;
		buh_map_info[?"room"] = room; 
	
		buh_map_info[?"dir"] = obj_buh.direction;
	}
}

hp = clamp(hp, 0, CONST_BUH_MAXHP);
armor = clamp(armor, 0, CONST_BUH_MAXARMOR);
buh_fuel = clamp(buh_fuel, 0, CONST_BUH_MAXFUEL);

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}


