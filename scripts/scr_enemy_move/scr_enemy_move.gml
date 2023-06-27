///// @function scr_enemy_moveToPlayer();
///// @param {}
///// @description скрипт, который двигает врага к персонажу, обходя препятствия
//function scr_enemy_moveToPlayer(){
	
//	var player = scr_player_type();
	
//	/*
//	ПРОВЕРКА НА ПРЕПЯТСТВИЯ
//	*/
//	//бежим к игроку, пока не столкнемся с ним
//	if (!place_meeting(x, y, player)) {
//		direction = point_direction(x, y, player.x, player.y);
//		image_angle = direction;
//		speed = enemy_spd;
//	} else {
//		speed = 0;
//	}
//}

///// @function scr_enemy_moveToPoint();
///// @param {} targetX Х координата, к которой нужно двигаться
///// @param {} targetY Y координата, к которой нужно двигаться
///// @description скрипт, который заставляет врага двигаться к случайной точке, обходя предметы
//function scr_enemy_moveToPoint(targetX, targetY){
//	/*
//	ПРОВЕРКА НА ПРЕПЯТСТВИЯ
//	*/
//	//движимся к заданной точке, пока не столкнемся с ним
//	if (point_distance(x, y, targetX, targetY) > 10) {
//		direction = point_direction(x, y, targetX, targetY);
//		image_angle = direction;
//		speed = enemy_spd / 2;
//	} else {
//		speed = 0;
//	}
//}