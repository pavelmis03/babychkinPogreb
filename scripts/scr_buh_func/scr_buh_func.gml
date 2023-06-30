/// @function scr_buh_chechPlayerDir();
/// @description в зависимости от направления и близости игрока определяет возможность 
	//взаимодействия: открыть инвентарь буханки, капот, сесть внутрь
function scr_buh_chechPlayerDir() {
	if (!buh_playerIn) {	//иначе игрок сидит в буханке
		//проверка на то, что направление и расстояние совпадают
		can_interact = 0;
		//освобождаем персонажа от коллизии
		if (player_obj.player_map_col[?type] == id) {	
			//массив коллизий игрока
			player_obj.player_map_col[?type] = 0;
		}
		var px = player_obj.x, py = player_obj.y;
		//если персонаж взаимодействует с именно с нашим объектом (чтобы сразу два случайно не сработали)
		if ((player_obj.player_map_col[?type] == 0) or (player_obj.player_map_col[?type] == id)) {
			//направление на задние двери
			if (abs(angle_difference(player_obj.image_angle, direction)) <= 30) { //задняя дверь
				if ((point_distance(x, y, px, py) > 300) and //проверяю, что расстояние от центра игрока до кабины значительно больше, чем если бы игрок стоял спереди
					//проверяю, что игрок смотрит именно на буханку (рисую линию коллизии от игрока прямо на 60 пх)
					(collision_line(px, py, px + lengthdir_x(60, player_obj.image_angle), py + lengthdir_y(60, player_obj.image_angle), obj_buh, true, false))) {	
					//массив коллизий игрока
					player_obj.player_map_col[?type] = id;
					//добавление подсказки о возможности открыть инвентарь буханки
					obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaOpenInv";
					can_interact = 2;	//взаимодействие - открыть инвентарь буханки
				}
			}
		
			//проверяю корректность направления взгляда игрока на буханку
			if ((abs(angle_difference(player_obj.image_angle, (direction + 270) % 360)) <= 30) and//можно сесть только слева
			(collision_line(px, py, px + lengthdir_x(50, player_obj.image_angle), py + lengthdir_y(50, player_obj.image_angle), obj_buh, true, false))
			/*(abs(angle_difference(player_obj.image_angle, point_direction(px, py, x, y))) <= 30) and можно сесть с любого бока*/
			//проверяю, что мы не смотрим на капот
			/*!(abs(angle_difference(player_obj.image_angle, (direction + 180) %360)) <= 40)*/) {
				if (point_distance(x, y, px, py) < 150) {	//проверяю, что расстояние от центра игрока до кабины небольшое
					if (obj_ctrl_gm_buh.buh_broke == 0) {	//если она не сломана
						//добавление подсказки о возможности сесть в буханку
						obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaSitdown";
						//массив коллизий игрока
						player_obj.player_map_col[?type] = id;
						can_interact = 1;	//взаимодействие - посадка
					} else {	//подсказка о том, что мы сломались
						obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaBroke";	
					}
				}
			}
	
			if (abs(angle_difference(player_obj.image_angle, (direction + 180) % 360)) <= 20) { //капот
				if ((point_distance(x, y, px, py) < 145) and //проверяю, что расстояние от центра игрока до кабины значительно больше, чем если бы игрок стоял спереди
					//проверяю, что игрок смотрит именно на буханку (рисую линию коллизии от игрока прямо на 60 пх)
					(collision_line(px, py, px + lengthdir_x(40, player_obj.image_angle), py + lengthdir_y(40, player_obj.image_angle), obj_buh, true, false))) {	
					//массив коллизий игрока
					player_obj.player_map_col[?type] = id;
					//добавление подсказки о возможности открыть меню улучшения буханки
					obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaUpgrade";
					if (buh_startTurn == 3) {	//если надо пнуть
						obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaNeedKick";	
					}
					can_interact = 3;	//взаимодействие - меню улучшения буханки
				}
			}
		}
	}
}

/// @function scr_buh_calcCurrFuelConsumption(startVal, mSpd, mxSpd);
/// @param {arr[3]} startVal [начальное, минимальное, максимальное] потребление топлива для данной передачи
/// @param {} mSpd минимальная скорость для передачи
/// @param {} mxSpd максимальная скорость для передачи
/// @param {} k1 коэффициент подгонки, на который мы делим скорость на первом участке
/// @param {} k2 коэффициент подгонки, в степень которого мы возводим скорость на третьем участке
/// @description рассчитывает потребление топлива по передаче и скорости по кривой потребления
	//https://1gai.ru/uploads/posts/2018-12/1543933692_2-4.jpg
function scr_buh_calcCurrFuelConsumption(startVal, mSpd, mxSpd, k1, k2) {
	//1ая передача: мин скор. 0		| макс. скор. 5.27	| 20% макс скор. 1.055
	//2ая передача: мин скор. 2.222	| макс. скор. 11.11	| 20% макс скор. 2.222
	//3ая передача: мин скор. 8.33	| макс. скор. 19.44	| 20% макс скор. 3.88
	//4ая передача: мин скор. 15.27	| макс. скор. 33.33	| 20% макс скор. 6.66
	//5ая передача: мин скор. 0		| макс. скор. 4.16	| 20% макс скор. 0.832
	//первый промежуток кривой (от минимальной скорости передачи до оптимальной (20% от максимальной + минимальная))
	if (abs(speed) - (0.2 * mxSpd + mSpd) <= -0.2) {
		//линейно уменьшаем потребление от начала первого промежутка до начала второго
		return startVal[0] - (abs(speed) - mSpd) / k1;
		//1ая передача дел 1.75 
		//2ая передача дел 3.17
		//3ая передача дел 7
		//4ая передача дел 16
		//5ая передача дел 1.6
	}
	//самое маленькое потребление на ~20% процентах от максимально выдаваемой скорости (в промежутке, т.е. + мин скорость)
	if (abs(abs(speed) - (0.2 * mxSpd + mSpd)) <= 0.2) {
		//возвращаем минимальное потребление с небольшим отклонением влево/вправо
		return startVal[1] + abs(speed) - (0.2 * mxSpd + mSpd);
		//1ая передача оптимальная скор 4км/ч
		//2ая передача оптимальная скор 16км/ч
		//3ая передача оптимальная скор 43км/ч
		//4ая передача оптимальная скор 77км/ч
		//5ая передача оптимальная скор 6км/ч
	}
	//третий промежуток кривой
	if (abs(speed) - (0.2 * mxSpd + mSpd) >= 0.2) {
		//тут нелинейная зависимость
		return startVal[1] + power(abs(speed) - (0.2 * mxSpd + mSpd), k2);
		//1ая передача - изм. расхода [16.5, 23] - степень 1.35
		//2ая передача - изм. расхода [14.8, 21.5] - степень 1
		//3ая передача - изм. расхода [14.2, 19.9] - степень 0.7
		//4ая передача - изм. расхода [13.8, 22] - степень 0.9	
		//5ая передача - изм. расхода [14.2, 17.7] - степень 1.2
	}
	
}

/// @function scr_buh_calcFuelConsumption();
/// @description расчитывает для каждой передачи (и на холостых) потребление топлива, для каждой передачи свои коэффициенты
	//уже все посчитано, это окончательный вариант!
	//https://1gai.ru/uploads/posts/2018-12/1543933692_2-4.jpg
function scr_buh_calcFuelConsumption() {
	if (scr_arr_fingEl([1, 3], buh_status, 1) != -1) {	//если заведена или едет
		var arr = buh_spds[buh_transmission];	//если у нас скорость была сильно больше, чем должна быть на тек. передаче
		if (speed - arr[1] > 0.3) {	//если скорость заметно больше (исключаем возможность погрешности при расчете скорости)
			//на нейтралке износа нет, а на реверсе такая ситуация невозможна (но сработает верхний if т.к. скорости отрицательные)
			if ((buh_transmission != 0) and (buh_transmission != 5)) {
				//чем больше разница передач, тем сильнее износ 
				//износ до 4% в зависимости от разницы скорости и передачи (со скорости 120 на первую - 4%)
				//buh_decomposition += obj_ctrl_gm_buh.CONST_BUH_MAXHP * (1 + buh_transmissionNeed - buh_transmission) / 100;
				//5000 потому что при модернизации износ должен остаться тот же, а не увеличиться, а MAXHP будет расти по мере прокачки
				obj_ctrl_gm_buh.hp -= /*obj_ctrl_gm_buh.CONST_BUH_MAXHP*/ 5000 * (1 + buh_transmissionNeed - buh_transmission) / 100; //мгновенный разовый износ
			}
		}
		//расчет потребления для каждой передачи
		switch (buh_transmission) {
			case 1: 
				//скрипт расчитывает потребление топлива, подробнее см. скрипт
				//([начальное потребление (в начале кривой), потребление в нижней точке кривой (второй участок), потребление на максимальной точке кривой (конец третьего участка], 
					//минимальная скорость, максимальная скорость, коэффициент для первого участка, степень для третьего участка)
				buh_fuelConsumption = scr_buh_calcCurrFuelConsumption([17.1, 16.5, 23], 0, 19 / 3.6, 1.75, 1.35);
				speed = clamp(speed, 0, 5.27);	//макс скорость для текущей передачи	
			break;	
			case 2: 
				buh_fuelConsumption = scr_buh_calcCurrFuelConsumption([15.5, 14.8, 21.5], 8 / 3.6, 40 / 3.6, 3.17, 1);
				speed = clamp(speed, 0, 11.11);
			break;
			case 3: 
				buh_fuelConsumption = scr_buh_calcCurrFuelConsumption([14.8, 14.2, 16.6], 30 / 3.6, 70 / 3.6, 7, 0.7);
				speed = clamp(speed, 0, 19.44);
			break;
			case 4: 
				buh_fuelConsumption = scr_buh_calcCurrFuelConsumption([14.2, 13.8, 19.3], 55 / 3.6, 120 / 3.6, 16, 0.9);
				speed = clamp(speed, 0, 33.33);
			break;											   
			case 5: 
				buh_fuelConsumption = scr_buh_calcCurrFuelConsumption([14.7, 14.2, 17.7], 0, 15 / 3.6, 1.6, 1.2);
				speed = clamp(speed, -4.16, 0);	//при движении задом
			break;
		}
		if (buh_transmission != 0) {	//потребление на всех передачах, кроме нейтрали
			var t1 = 1;	//поверхность
			var tt = instance_position(x, y, obj_ctrl_gm_surf);	//проверяю коллизию с поверхностью
			if (tt != noone) {	//если под нами определена поверхность
				t1 = tt.surf_params[1][2];	//потребление на этой поверхности
			}
			//потребление на 100 км
			var t = (buh_fuelConsumption * t1) / room_speed / (100 / (abs(speed) * 3.6) * 3600/*за сколько сек. мы проедем 100 км*/);
			//в формуле выше что-то не так: оно тратится в 8 раз медленнее 
			obj_ctrl_gm_buh.buh_fuel -= t * 10;
		}
		//если нейтралка или сцепление
		if ((buh_transmission == 0) or (buh_coupling)) { 
			buh_fuelConsumption = 2.4;	//фиксированное значение потребления
			if ((keyboard_check(ord("W"))) and (!buh_handbrake)) {	//но если игрок давит на газ, оно увеличивается
				buh_fuelConsumption += 6;
			}
			obj_ctrl_gm_buh.buh_fuel -= buh_fuelConsumption / room_speed / 3600;	//потребление в час
		}
		obj_ctrl_gm_buh.buh_fuel = clamp(obj_ctrl_gm_buh.buh_fuel, 0, 77);
	}
}

/// @function scr_buh_stallAction(flag);
/// @param {} flag глушить сразу движок или дать шанс
/// @description действия при заглушении движка
function scr_buh_stallAction(flag) {
	if (flag) {	//дать шанс
		//заглушение движка через некоторое время
		var arr = buh_spds[buh_transmission]; 	//скорости для текущей передачи
		if (abs(speed) > 0.3 * abs(arr[0])) {//если скорость меньше, чем 30% от мин скорости для текущей передачи
			if (alarm_get(1) <= 0) {	//если мы еще не завели таймер
				//даем шанс исправить скорость или передачу
				alarm[1] = irandom_range(2, 5) * room_speed;
				scr_snd_requestPlaySnd(snd_buh_preStall, snd_buh_preStall, 20, true);	//звук чихающего движка
				obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaPreStall";
				buh_decomposition = 5000 * 0.01; //износ при чихании движка 1%/сек
			}
		} else {	//если разница слишком большая, сразу глохнем
			scr_buh_stallAction(false);
			alarm_set(1, -1);	//отключаем таймер
			//максимальная скорость на которой мы можем заглохнуть - 0.3*55 (16.5)
			//когда speed * 3.6 == 16.5 - износ 6% (16.5 делю га 2.75, чтобы получить 6)
			obj_ctrl_gm_buh.hp -= 5000 * (abs(speed) * 3.6 / 2.75) / 100; //мгновенный разовый износ (до 6%)
		}
	} else {//эта часть функции может быть вызвана другими объектами
		//заглушение движка сразу
		obj_buh.buh_status = 2;
		obj_buh.buh_startTurn = 3;	//чтобы статус заглохшей не сбросился, когда выйдем из машины
		scr_snd_requestPlaySnd(snd_buh_stall, snd_buh_stall, 20, true);	//звук глохнущего движка
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaStall";	
		scr_snd_requestPlaySnd(snd_buh_idle, snd_buh_idle, 20, false);	//останавливаем звук холостого двигателя
		scr_snd_requestPlaySnd(snd_buh_movement, snd_buh_movement, 20, false);	//останавливаем звук движения
		//износ не нужен, он в местах вызова прописан
	}
}

/// @function scr_buh_aniEndFunc(spr);
/// @param {} spr спрайт, с которым мы работаем
/// @param {} snd звук к этому спрайту
/// @description вынес сюда одинаковый код для запуска спрайтов в обратную сторону
	//после проигрывания вперед (это для багажника и капота буханки)
function scr_buh_aniEndFunc(spr, snd) {
	
	//переход в комнату взаимодействия с буханкой
	
	if (image_speed == -1) {	//если выходим из комнаты взаимодействия
		scr_snd_requestPlaySnd(snd, snd, 20, true);	//звук 
		scr_env_stopInteract()	//прекращаем взаимодействие с персонажем
		//буханка теперь просто стоит
		sprite_index = spr_buh_state;
		image_index = 0;
		image_speed = 1;
	} else { // если только зашли в багажник/капот
		//если открывали багажник/капот, то попали в другую комнату, при выходе, проигрываем 
		//спрайт в другую сторону: закрываем багажник/капот
		sprite_index = spr;
		image_speed = -1;
		image_index = image_number - 0.1;
	}
}



















