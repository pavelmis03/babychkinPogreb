/// @description состояния

// объект игрока
player = scr_player_type();

if (player != -1) {
	// БЛОК ИЗМЕНЕНИЯ КОЭФФИЦИЕНТОВ ОСНОВНЫХ ПАРАМЕТРОВ
	
	// значения на которые уменьшаются параметры
	var decr_food = 0.07, coef_food = 1;
	var decr_water = 0.09, coef_water = 1;
	var decr_temp = 1, coef_temp = 1;
	var decr_crazy = 1, coef_crazy = 1;
	
	
	
	// при ходьбе расход увеличивается
	if (player.player_moveType != "stand") {
		coef_food += 0.1;
		coef_water += 0.1;
		coef_temp += 0.1;
		coef_crazy += 0.1;
	}
	
	
	
	// при беге расход увеличивается еще сильнее
	if (player.player_run) {
		coef_food += 0.1;
		coef_water += 0.1;
		coef_temp += 0.1;
		coef_crazy += 0.1;
	}
	
	
	// бег
	if (player.player_run) {
		// уменьшаю силы для бега
		player_runPower -= player.CONST_PLAYER_RUNPOWERCONSUMPTION / fps;
		player_runTimeLess = 0;	// время с остановки бега
		// если мы потратили много энергии за раз, придется ждать, пока она восстановится больше
		if (player_runPower < player_runPowerMax / 6) {
			player_runPowerEnded = 25;
		}
		if (player_runPower < player_runPowerMax / 20) {
			player_runPowerEnded = 40;
		}
	} else {
		// если персонаж стоит, то время с момента остановки до регенерации проходит быстрее
		if (player.player_moveType == "stand") {
			player_runTimeLess += 2 / fps;
		} else {
			player_runTimeLess += 1 / fps;
		}
	
		// восстановление самих сил, если прошло достаточно времени 
		if (player_runTimeLess >= player.CONST_PLAYER_RUNPOWERREGDELAY) {
			if (player_runPower < player_runPowerMax) {
				// если персонаж стоит, восстановление проходит быстрее
				if (player.player_moveType == "stand") {
					player_runPower += player.CONST_PLAYER_RUNPOWERREGSPEED / fps;
				} else {
					player_runPower += player.CONST_PLAYER_RUNPOWERREGSPEED / fps / 2;
				}
				// если энергия сильно потратилась, ждем, пока не восстановится достаточно
				if (player_runPower > player_runPowerEnded) {
					player_runPowerEnded = 0;
				}	
			}
		}	
	}
	
	// БЛОК ВОССТАНОВЛЕНИЯ ХП
	// если персонаж ранен, его жизни сами восстанавливаются на четверть, потребляя больше пищи
	if (hp < HP_MAX / 4) {
		// hp восстанавливается только при достаточном запасе еды и воды
		if ((player_water > 15) and (player_food > 20) and (player_temp > 20) and (player_crazy < 80)) {
			// если персонаж не получает урон, засекаем 10 секунд, чтобы начать восстанавливать жизни 
			if (player_preHp <= hp) {
				player_dmgTimeLess += 1 / fps;
			} else {
				// если урон был получен, скидываем таймер и обновляем старые жизни
				player_dmgTimeLess = 0;
			}
			// обновляем жизни в любом случае, в какую бы сторону они не изменились
			player_preHp = hp;
			// если с момента последнего получения урона прошло 10 сек., начинаем воссанавливать жизни
			if (player_dmgTimeLess >= 10) {	
				// до 110 быстрее восстановление идет
				if (hp < HP_MAX / 10) {
					// до 40 +3 hp/sec, до 80 +2 hp/sec, до 110 +hp/sec
					hp += (3 - hp / 40) / fps;
					// при восстановлении здоровья расход пищи и воды увеличивается
					coef_food += 0.9;
					coef_water += 0.5;
				} else {	// после 110 идет восстановление +hp/3 sec
					hp += 0.33 / fps;
					// при восстановлении здоровья расход пищи и воды увеличивается
					coef_food += 0.8;
					coef_water += 0.4;

				}
			}
		}
	}	
	
	// БЛОК УМЕНЬШЕНИЯ ХП ПО ОСНОВНЫМ ПАРАМЕТРАМ
	var decr_hp = 0, coef_hp = 1;
	var min_food = 10, min_water = 8, min_temp = 15, max_crazy = 90;
	
	if (player_food <= min_food) {
		decr_hp += 0.5 + (min_food - player_food) / min_food;
	}
	
	if (player_water <=  min_water) {
		decr_hp += 0.3 + (min_water - player_water) / min_water;
	}
	if (player_temp <= min_temp) {
		decr_hp += 0.7 + (min_temp - player_temp) / min_temp;
	}
	if (player_crazy >= max_crazy) {
		decr_hp += 0.5 + (player_crazy - max_crazy) / (100 - max_crazy);
	}
	
	hp -= decr_hp * coef_hp / fps;
	
	
	
	// уменьшение параметра игрока с учетом коэффициентов
	player_food -= decr_food * coef_food / fps;
	player_water -= decr_water * coef_water / fps;
}


// голод, жажда, шиза, тепло в процентах
player_food = clamp(player_food, 0, player_foodMax);	// в процентах
player_water = clamp(player_water, 0, player_waterMax);
player_temp = clamp(player_temp, 0, player_tempMax);
player_crazy = clamp(player_crazy, 0, player_crazyMax);
hp = clamp(hp, 0, HP_MAX);
player_runPower = clamp(player_runPower, 0, player_runPowerMax);






















