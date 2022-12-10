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
}