/// @function scr_player_moveType();;
/// @description скрипт определяет тип движения игрока и направление движения в зависимости от типа
function scr_player_moveType() {
	//если ни одна клавиша движения не нажата, то тип движения, очевидно, - стоит
	//если игрок близко подошел к курсору
	if (ds_list_size(player_move_key_list) == 0) {
		player_moveType = "stand";
		speed = 0;
		sprite_index = spr_playerFP_state;
		return;
	}
	//получаем последнюю из нажатых клавиш
	var t1 = player_move_key_list[|ds_list_size(player_move_key_list) - 1];
	//при движении по сетке эта клавиша корректируется в зависимости от направления персонажа на курсор
	if (obj_ctrl_set.ctrl_set_map_curr[?"gridMv"]) { 
		t1 = scr_player_angleDiff(t1);
	}
	//тип движения по одной клавише
	switch (t1) {
		case "W":
			player_moveType = "forward";
		break;
		case "A":
			player_moveType = "left";
		break;
		case "S":
			player_moveType = "backward";
		break;
		case "D":
			player_moveType = "right";
		break;
	}
	//если клавиша в массиве только одна, определяем направление движения и завершаем скрипт
	if (ds_list_size(player_move_key_list) == 1) {
		//т.к. направление движения зависит именно от нажатой клавиши (а в случае движения по сетке 
		//клавиша искуственно подменяется), то в скрипт опр. направления движения передается клавиша из массива
		scr_player_dir(player_move_key_list[|ds_list_size(player_move_key_list) - 1])
	} else {
		//если в массиве нажатых клавиш больше одной ячейки, повторяем те же действия, что и выше, только для двух клавиш
		var t2 = player_move_key_list[|ds_list_size(player_move_key_list) - 2];
		if (obj_ctrl_set.ctrl_set_map_curr[?"gridMv"]) { 
			t2 = scr_player_angleDiff(t2);
		}
		//вторая клавиша может добавить побочное направление или не может, если это клавиша противоположна
		//нажатой, тогда эта часть скрипта ничего не изменит
		var s = t1 + t2;
		if (s == "WA" or s == "AW") {
			player_moveType = "lforward";
		}
		if (s == "WD" or s == "DW") {
			player_moveType = "rforward";
		}
		if (s == "SA" or s == "AS") {
			player_moveType = "lbackward";
		}
		if (s == "SD" or s == "DS") {
			player_moveType = "rbackward";
		}
		//т.к. направление движения зависит именно от нажатой клавиши (а в случае движения по сетке 
		//клавиша искуственно подменяется), то в скрипт опр. направления движения передается клавиша из массива
		s = player_move_key_list[|ds_list_size(player_move_key_list) - 1] + player_move_key_list[|ds_list_size(player_move_key_list) - 2];
		scr_player_dir(s);
	}
}


/// @function scr_player_angleDiff();
/// @param {} key передаваемая клавиша
/// @description определяет разницу между оригинальным направлением (на 90 градусов) и направлением на 
//курсор, это нужно для движения игрока по сетке, чтобы определить, каким он боком двигается на самом деле
//не зависимо от нажатой клавиши, а лишь от направления на курсор, и поменять название клавиши в соответствии с этим
function scr_player_angleDiff(key) {
	var tarr = ds_list_create();
	ds_list_add(tarr, "W", "A", "S", "D");
	var tinc = 0;
	//в зависимости от угла направления на курсор, оригинальная сетка сдвигается на несколько четвертей 
	//w -> a, a -> s... - первый поворот, w -> s, a -> d... - второй
	if ((image_angle < 45) or (image_angle > 315)) { 
		tinc++;
	}
	if ((225 < image_angle) and (image_angle < 315)) { 
		tinc = 2;
	}
	if ((135 < image_angle) and (image_angle < 225)) { 
		tinc = 3;
	}
	return tarr[|((ds_list_find_index(tarr, key) + tinc) mod 4)];
	ds_list_destroy(tarr);
}


/// @function scr_player_dir();
/// @param {} str клавиши, из которых складывается направление. нужно для движения по сетке
/// @description определяет непосредственно направление
function scr_player_dir(str) {
	switch (player_moveType) {
		case "forward": 
			direction = point_direction(x, y, mouse_x, mouse_y);
		break;
		case "lforward": 
			direction = point_direction(x, y, mouse_x, mouse_y) + 45;
		break;
		case "rforward": 
			direction = point_direction(x, y, mouse_x, mouse_y) - 45;
		break;
		case "backward": 
			direction = point_direction(x, y, mouse_x, mouse_y);
		break;
		case "lbackward": 
			direction = point_direction(x, y, mouse_x, mouse_y) - 45;
		break;
		case "rbackward": 
			direction = point_direction(x, y, mouse_x, mouse_y) + 45;
		break;
		case "right": 
			direction = point_direction(x, y, mouse_x, mouse_y) - 90;
		break;
		case "left": 
			direction = point_direction(x, y, mouse_x, mouse_y) + 90;
		break;
	}
	//при движении по сетке направления фиксированные
	if (obj_ctrl_set.ctrl_set_map_curr[?"gridMv"]) { 
		if (str == "WA" or str == "AW") {
			direction = 135;
		}
		if (str == "WD" or str == "DW") {
			direction = 45;
		}
		if (str == "SA" or str == "AS") {
			direction = 225;
		}
		if (str == "SD" or str == "DS") {
			direction = 315;
		}
		switch (str) {
			case "W": direction = 90; break;
			case "A": direction = 180; break;
			case "S": direction = 270; break;
			case "D": direction = 0; break;
		}
	}
	speed = scr_player_spd();
	sprite_index = scr_player_moveSpr();
	
	//если игрок близко к курсору, то, если он приближается, останавливаем его
	var tx = lerp(x, x + hspeed, 1);
	var ty = lerp(y, y + vspeed, 1);
	var player_need_stop = false;	//флаг остановки игрока
	if ((distance_to_point(mouse_x, mouse_y) < 1) and
		//проверка на приближение
		(point_distance(x, y, mouse_x, mouse_y) > point_distance(tx, ty, mouse_x, mouse_y))) {
		player_need_stop = true;
	}
	
	//если мы следующим шагом столкнемся со стеной или чем-то подобным, останавливаемся
	for (var i = 0; i < array_length(player_solidObj); i++) {
		var curr_dist = distance_to_object(player_solidObj[i]);
		if (curr_dist < 2) {
			var curr_x = x;
			var curr_y = y;
			x = tx;
			y = ty;
			//если при следующем шаге расстояние до стены не увеличится, то идти не нужно
			if (distance_to_object(player_solidObj[i]) <= curr_dist) {
				player_need_stop = true;
			}
			x = curr_x;
			y = curr_y;
		}
	}
	
	if (player_need_stop) {
		player_moveType = "stand";
		speed = 0;
		sprite_index = spr_playerFP_state;
	}
}


/// @function scr_player_spd();
/// @description определяет скорость по типу
function scr_player_spd() {
	var spd = 0;
	//вроде костыль, но безобидный: при движении по сетке скорость должна быть положительной всегда
	var t = 1;
	if (obj_ctrl_set.ctrl_set_map_curr[?"gridMv"]) { 
		t = -1;
	}
	switch (player_moveType) {
		case "forward": 
			spd = player_main_speed;
		break;
		case "lforward": 
			spd = player_main_speed;
		break;
		case "rforward": 
	 		spd = player_main_speed;
		break;
		case "backward": 
			spd = -player_main_speed * t;
		break;
		case "lbackward": 
			spd = -player_main_speed * t;
		break;
		case "rbackward": 
			spd = -player_main_speed * t;
		break;
		case "right": 
			spd = player_main_speed / 3 * 2;
		break;
		case "left": 
			spd = player_main_speed / 3 * 2;
		break;
	}
	return spd;
}

/// @function scr_player_moveSpr();
/// @description определяет спрайт по типу движения
function scr_player_moveSpr() {
	var spr = spr_playerFP_state;
	switch (player_moveType) {
		case "forward": 
			spr = spr_playerFP_go;
			image_speed = 1;
		break;
		case "lforward": 
			spr = spr_playerFP_go;
			image_speed = 1;
		break;
		case "rforward": 
			spr = spr_playerFP_go;
			image_speed = 1;
		break;
		case "backward": 
			spr = spr_playerFP_go;
			image_speed = -1;
		break;
		case "lbackward": 
			spr = spr_playerFP_go;
			image_speed = -1;
		break;
		case "rbackward": 
			spr = spr_playerFP_go;
			image_speed = -1;
		break;
		case "right": 
			spr = spr_playerFP_go_lAndr;
			image_speed = 1;
		break;
		case "left": 
			spr = spr_playerFP_go_lAndr;
			image_speed = -1;
		break;
	}
	return spr;
}