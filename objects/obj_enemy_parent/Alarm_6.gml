/// @description enemy_wander
randomize();

//задается рандомное направление в котором враг идет рандомно долго и иногда останавливается, чтобы отдохнуть
if (enemy_wander) {
	//выбираю координаты в области брожения
	var t_x = random_range(enemy_wanderBaseX - enemy_wanderMaxDist, enemy_wanderBaseX + enemy_wanderMaxDist);
	var t_y = random_range(enemy_wanderBaseY - enemy_wanderMaxDist, enemy_wanderBaseY + enemy_wanderMaxDist);
	
	//иногда враг останавливается и стоит (если есть спрайт стояния)
	if ((irandom(3) == 3) and (enemy_spr_state != spr_sys_none)) {
		speed = 0;
		sprite_index = enemy_spr_state;
		image_index = 0;
	} else { //рандомное движение к точке
		sprite_index = enemy_spr_go;
		image_index = 0;
		scr_enemy_moveToPoint(t_x, t_y);
	}
}

//этот таймер всегда работает, независимо от ситуации с рандомным хождением
alarm[6] = irandom_range(2 * room_speed, 5 * room_speed);


