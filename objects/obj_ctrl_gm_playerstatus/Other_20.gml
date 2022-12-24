/// @description состояния

//объект игрока
player = scr_player_type();

if (player != -1) {
	//бег
	if (player.player_run) {
		//уменьшаю силы для бега
		player_runPower -= player.CONST_PLAYER_RUNPOWERCONSUMPTION / room_speed;
		player_runTimeLess = 0;	//время с остановки бега
		//если мы потратили много энергии за раз, придется ждать, пока она восстановится больше
		if (player_runPower < 15) {
			player_runPowerEnded = 25;
		}
		if (player_runPower < 5) {
			player_runPowerEnded = 40;
		}
	} else {
		//если персонаж стоит, то время с момента остановки до регенерации проходит быстрее
		if (player.player_moveType == "stand") {
			player_runTimeLess += 2 / room_speed;
		} else {
			player_runTimeLess += 1 / room_speed;
		}
	
		//восстановление самих сил, если прошло достаточно времени 
		if (player_runTimeLess >= player.CONST_PLAYER_RUNPOWERREGDELAY) {
			if (player_runPower < 100) {
				//если персонаж стоит, восстановление проходит быстрее
				if (player.player_moveType == "stand") {
					player_runPower += player.CONST_PLAYER_RUNPOWERREGSPEED / room_speed;
				} else {
					player_runPower += player.CONST_PLAYER_RUNPOWERREGSPEED / room_speed / 2;
				}
				//если энергия сильно потратилась, ждем, пока не восстановится достаточно
				if (player_runPower > player_runPowerEnded) {
					player_runPowerEnded = 0;
				}	
			}
		}	
	}
	
	//если персонаж ранен, его жизни сами восстанавливаются на четверть, потребляя больше пищи
	if (hp < 250) {
		//если персонаж не получает урон, засекаем 10 секунд, чтобы начать восстанавливать жизни 
		if (player_preHp <= hp) {
			player_dmgTimeLess += 1 / room_speed;
		} else {
			//если урон был получен, скидываем таймер и обновляем старые жизни
			player_dmgTimeLess = 0;
		}
		//обновляем жизни в любом случае, в какую бы сторону они не изменились
		player_preHp = hp;
		//если с момента последнего получения урона прошло 10 сек., начинаем воссанавливать жизни
		if (player_dmgTimeLess >= 10) {
			//if () {	//проверка друигх параметров персонажа
				//до 110 быстрее восстановление идет
				if (hp < 110) {
					//до 40 +3 hp/sec, до 80 +2 hp/sec, до 110 +hp/sec
					hp += (3 - hp / 40) / room_speed;
					//УВЕЛИЧИТЬ РАСХОД ПИЩИ
				} else {	//после 110 идет восстановление +hp/3 sec
					hp += 0.33 / room_speed;
					//УВЕЛИЧИТЬ РАСХОД ПИЩИ
				}
			//}
		}
	}
}






















