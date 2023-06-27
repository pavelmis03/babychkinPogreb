/// @description газ
if (scr_arr_fingEl([1, 3], buh_status, 1) != -1) {	//если заведена или едет
	if (buh_handbrake) {	//если включен ручник
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaHandbrake";
	} else {
		if ((!buh_coupling) and (buh_transmission != 0)) {	//если не нейтраль и не сцепление
			var t = clamp(1 - clamp(speed * 3.6 - 30, 0, speed * 3.6) / 140, 0.3, 1);	//уменьшенение ускорения по сопротивлению воздуха (от 30км/ч начинается) (до 3х раз уменьшение)
			var t1 = clamp(1, 0.5, 1);		//уменьшенение ускорения по сопротивлению поверхности (до 2х раз уменьшение)
			var t2t = obj_ctrl_gm_buh.hp / (obj_ctrl_gm_buh.CONST_BUH_MAXHP * 2) + 0.5; //таким образом значение ф-и будет изменяться от 0.5 при hp = 0 до 1 при hp = maxHp
			var t2 = clamp(t2t, 0.5, 1);	//уменьшенение ускорения по износу (до 2х раз уменьшение)
			if (buh_transmission == 5) { //если едем задом
				t = -0.6;	//у нас отрицательная скорость (и разгон задом меньше, чем передом)
							//характеристики разгона по поверхности и износу не меняются
			}
			//увеличиваем скорость на величину ускорения, уменьшенного по параметрам t, t1, t2
			speed += (CONST_BUH_BOOST * t * t1 * t2) / room_speed;
			scr_snd_requestPlaySnd(snd_buh_gas, snd_buh_gas, 20, true);	//воспроизводим звук рычания
		} else {
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankagasN";
			scr_snd_requestPlaySnd(snd_buh_gasN, snd_buh_gasN, 20, true);	//воспроизводим звук рычания на нейтрали
		}
	}
}