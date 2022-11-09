/// @description состояния

//объект игрока
player = scr_player_type();

if (player != -1) {
	//бег
	if (player.player_run) {
		//уменьшаю силы для бега
		player.player_runPower -= player.CONST_PLAYER_RUNPOWERCONSUMPTION / room_speed;
		ctrl_status_runTimeLess = 0;	//время с остановки бега
		//если мы потратили много энергии за раз, придется ждать, пока она восстановится больше
		if (player.player_runPower < 15) {
			ctrl_status_runPowerEnded = 25;
		}
		if (player.player_runPower < 5) {
			ctrl_status_runPowerEnded = 40;
		}
	} else {
		//если персонаж стоит, то время с момента остановки до регенерации проходит быстрее
		if (player.player_moveType == "stand") {
			ctrl_status_runTimeLess += 2 / room_speed;
		} else {
			ctrl_status_runTimeLess += 1 / room_speed;
		}
	
		//восстановление самих сил, если прошло достаточно времени 
		if (ctrl_status_runTimeLess >= player.CONST_PLAYER_RUNPOWERREGDELAY) {
			if (player.player_runPower < 100) {
				//если персонаж стоит, восстановление проходит быстрее
				if (player.player_moveType == "stand") {
					player.player_runPower += player.CONST_PLAYER_RUNPOWERREGSPEED / room_speed;
				} else {
					player.player_runPower += player.CONST_PLAYER_RUNPOWERREGSPEED / room_speed / 2;
				}
				//если энергия сильно потратилась, ждем, пока не восстановится достаточно
				if (player.player_runPower > ctrl_status_runPowerEnded) {
					ctrl_status_runPowerEnded = 0;
				}	
			}
		}	
	}
	
	
}