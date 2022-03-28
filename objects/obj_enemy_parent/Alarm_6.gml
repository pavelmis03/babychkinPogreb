/// @description enemy_wander
randomize();

//задается рандомное направление в котором враг идет рандомно долго
if (enemy_wander) {
	//выюираю случайное направление
	var t_dir = random(360);
	//выбираю случайную длину пути
	var t_len = irandom_range(enemy_seeDist, enemy_seeDist * 4);
	scr_enemy_moveToPoint(x + lengthdir_x(t_len, t_dir), y + lengthdir_y(t_len, t_dir));
}

//этот таймер всегда работает, независимо от ситуации с рандомным хождением
alarm[6] = irandom_range(1 * room_speed, 5 * room_speed);


