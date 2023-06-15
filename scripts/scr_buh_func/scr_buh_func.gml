/// @function scr_buh_chechPlayerDir();
/// @description в зависимости от направления и близости игрока определяет возможность 
	//взаимодействия: открыть инвентарь буханки, капот, сесть внутрь
function scr_buh_chechPlayerDir() {
	//проверка на то, что направление и расстояние совпадают
	can_interact = 0;
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
				//массив коллизий игрока
				player_obj.player_map_col[?type] = id;
				//добавление подсказки о возможности сесть в буханку
				obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaSitdown";
				can_interact = 1;	//взаимодействие - посадка
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
	if (speed - (0.2 * mxSpd + mSpd) < -0.2) {
		//линейно уменьшаем потребление от начала первого промежутка до начала второго
		return startVal[0] - (speed - mSpd) / k1;
		//1ая передача дел 1.75 
		//2ая передача дел 3.17
		//3ая передача дел 7
		//4ая передача дел 16
		//5ая передача дел 1.8
	}
	//самое маленькое потребление на ~20% процентах от максимально выдаваемой скорости (в промежутке, т.е. + мин скорость)
	if (abs(speed - (0.2 * mxSpd + mSpd)) < 0.2) {
		//возвращаем минимальное потребление с небольшим отклонением влево/вправо
		return startVal[1] + speed - (0.2 * mxSpd + mSpd);
		//1ая передача оптимальная скор 4км/ч
		//2ая передача оптимальная скор 16км/ч
		//3ая передача оптимальная скор 43км/ч
		//4ая передача оптимальная скор 77км/ч
		//5ая передача оптимальная скор 6км/ч
	}
	//третий промежуток кривой
	if (speed - (0.2 * mxSpd + mSpd) > 0.2) {
		//тут нелинейная зависимость
		return startVal[1] + power(speed - (0.2 * mxSpd + mSpd), k2);
		//1ая передача - изм. расхода [16.5, 23] - степень 1.35
		//2ая передача - изм. расхода [14.8, 21.5] - степень 1
		//3ая передача - изм. расхода [14.2, 19.9] - степень 0.7
		//4ая передача - изм. расхода [13.8, 22] - степень 0.9	
		//5ая передача - изм. расхода [16.5, 20.4] - степень 1.1
	}
	
}

/// @function scr_buh_calcFuelConsumption();
/// @description расчитывает для каждой передачи (и на холостых) потребление топлива, для каждой передачи свои коэффициенты
	//уже все посчитано, это окончательный вариант!
	//https://1gai.ru/uploads/posts/2018-12/1543933692_2-4.jpg
function scr_buh_calcFuelConsumption() {
	if (scr_arr_fingEl([1, 3], buh_status, 1) != -1) {	//если заведена или едет
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
				buh_fuelConsumption = scr_buh_calcFuelConsumption([13.7, 13, 14.4], 0, 15 / 3.6);
				speed = clamp(speed, -4.16, 0);	//при движении задом
			break;
		}
		if (buh_transmission != 0) {	//потребление на всех передачах, кроме нейтрали
			//потребление на 100 км
			var t = buh_fuelConsumption / room_speed / (100 / (speed * 3.6) * 3600/*за сколько сек. мы проедем 100 км*/);
			//в формуле выше что-то не так: он тратится в 8 раз медленнее 
			obj_ctrl_gm_buh.buh_fuel -= t * 8;
		}
		//если нейтралка или сцепление
		if ((buh_transmission == 0) or (buh_coupling)) { 
			buh_fuelConsumption = 2.4;
			obj_ctrl_gm_buh.buh_fuel -= buh_fuelConsumption / room_speed / 3600;	//потребление в час
		}
	}
}

