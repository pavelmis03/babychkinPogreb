/// @description случайные события (заглохнуть, сломаться)

//возможность заглохнуть или сломаться
if (buh_status == 3) {	//только если мы едем
	if (obj_ctrl_gm_buh.hp < 0.2 * 5000) {	//если целостность меньше 20% от первоначальной (непрокачанной)
		var t = obj_ctrl_gm_buh.hp / 100;	//при целостности 1000 - шанс заглохнуть 1/10, если уменьшается целостность, шанс увеличивается до 1/4
		if (irandom_range(1, clamp(ceil(t), 4, 10)) == 3) {
			obj_ctrl_gm_buh.hp -= 5000 * 0.02; //мгновенный разовый износ 2%
			scr_buh_stallAction(false);	
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaStallDecomp";
		}
	}

	if (obj_ctrl_gm_buh.buh_broke == 0) {
		//возможность сломаться
		if (obj_ctrl_gm_buh.hp < 0.1 * 5000) {	//если целостность меньше 10%
			var t = obj_ctrl_gm_buh.hp / 50; //при целостности 500 - t = 10, если меньше, шанс сломаться увеличивается
			if (irandom_range(1, clamp(ceil(t), 3, 10)) == 2) { //шанс зависит от целостности
				scr_buh_stallAction(false);		//глохнем
				obj_ctrl_gm_buh.buh_broke = 1;	//мы сломаемся после остановки
				obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaBrokeNow";
			}
		}
	}
}

alarm[2] = 7 * room_speed;	//раз в 10 секунд играем в рулетку