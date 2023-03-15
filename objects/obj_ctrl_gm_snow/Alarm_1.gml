/// @description изменение snow_maxCnt с течением времени и создание новых снежинок

if (!snow_snowstorm) {
	snow_maxCnt += /*round*/((snow_numOfSnowflake[1] - snow_numOfSnowflake[0]) / snow_time / 4);
} else {
	//чтобы плотность была переменная
	snow_maxCnt += /*round*/((snow_numOfSnowflake[1] - snow_numOfSnowflake[0]) / snow_time / 4) * irandom_range(1, 1.4);
}
alarm[1] = room_speed / 4;

//количество снежинок в группе 
var flakeInGroup = snow_maxCnt / snow_groupCnt;

for (var i = 0; i < snow_groupCnt; i++) {	//цикл по группам
	var tPointCreate = irandom_range(0, 180);	//в какой области вида создавать группу снежинок
	for (var j = snow_nowCnt[i]; j <= flakeInGroup; j++) {	//цикл по снежинкам (добавляем пустые)
		//выбираем где создавать конкретную снежинку, немного отклоняясь от места создания группы
		var t = irandom_range(tPointCreate - tPointCreate * 0.10, tPointCreate * 1.10);
		var tx = camera_get_view_x(view_camera[0]);
		var ty = camera_get_view_y(view_camera[0]);
		
		if (!snow_snowstorm) {
			if (t <= 45) {	//за правой стенкой камеры
				//добавляю 64 к х, чтобы снежики создавались не на линии камеры, а за ней
				tx += camera_get_view_width(view_camera[0]) + 64;
				//создавать снежинки можно только в верхней половине вида, поэтому / 2, потом 
				//перевожу градусы в координаты: / 45 * t (на правую половину выделено 45 градусов,
				//поэтому делю на 45 частей, потом умножаю на рандомный градус 45 - t (потому что ось y сверху вниз идет)
				ty += camera_get_view_height(view_camera[0]) / 2 / 45 * (45 - t);
			}
			if (t >= 135) {	//за левой стенкой камеры
				//tx по умолчанию равен 0, отодвигаю его влево, чтобы снежинки создавались за линией камеры, а не на ней
				tx -= 64;
				//аналогично предыдущему условию, только еще вычитаю 135, потому что t должен быть в диапазоне от 0 до 45
				ty += camera_get_view_height(view_camera[0]) / 2 / 45 * (45 - (t - 135));
			}
			if ((t > 45) and (t < 135)) {	//над верхней стенкой камеры
				//создаем снежинки ровно сверху над видом, используя всю длину вида, поэтому не делю на два
				//по той же причине делю на 90 градусов (потому что вся длина, а не половина)
				//т.к. t в даннос случае принадлежит (45, 135), а частей (на которые делим длину) всего 90, вычитаю (t - 45)
				tx += camera_get_view_width(view_camera[0]) / 90 * (90 - (t - 45));
				//tу по умолчанию равен 0, отодвигаю его вверх, чтобы снежинки создавались за линией камеры, а не на ней
				ty -= 64;
			}
		} else {
			//для метели 
			switch(snow_stormDir) {
				case 0:		//правая стенка
					tx += camera_get_view_width(view_camera[0]) + 100;
					ty += irandom_range(0, camera_get_view_height(view_camera[0]));
					t = 180;	//направление метели
				break;
				case 1:		//правая стенка
					tx += camera_get_view_width(view_camera[0]) + 100;
					ty += irandom_range(0, camera_get_view_height(view_camera[0]));
					t = 180;	//направление метели
				break;
				case 2: //левая стенка
					tx += -100;
					ty += irandom_range(0, camera_get_view_height(view_camera[0]));
					t = 0;	//направление метели
				break;
				case 3: //левая стенка
					tx += -100;
					ty += irandom_range(0, camera_get_view_height(view_camera[0]));
					t = 0;	//направление метели
				break;
			}
		}
		//	switch(snow_stormDir) {
		//		case 0:		//правый нижний угол
		//			tx += irandom_range(camera_get_view_width(view_camera[0]), camera_get_view_width(view_camera[0]) + 800);
		//			ty += irandom_range(camera_get_view_height(view_camera[0]), camera_get_view_height(view_camera[0]) + 800);
		//			t = 135;	//направление метели
		//		break;
		//		case 1: //правый верхний угол
		//			tx += irandom_range(camera_get_view_width(view_camera[0]), camera_get_view_width(view_camera[0]) + 800);
		//			ty += irandom_range(-800, 0);
		//			t = 225;	//направление метели
		//		break;
		//		case 2: //левый верхний
		//			tx += irandom_range(-800, 0);
		//			ty += irandom_range(-800, 0);
		//			t = 315;	//направление метели
		//		break;
		//		case 3: //левый нижний
		//			tx += irandom_range(-800, 0);
		//			ty += irandom_range(camera_get_view_height(view_camera[0]), camera_get_view_height(view_camera[0]) + 800);
		//			t = 45;	//направление метели
		//		break;
		//	}
		//}
		//создаю снежинку
		var obj = instance_create_depth(tx, ty, depth, obj_nature_snow);
		obj.snow_startSpd = random_range(1, 3);	//начальные скорость и направление
		obj.snow_startDir = t + 180 + irandom_range(5, 30); //летим в противоположном от начального направлении с отклонением до 30 градусов
		if (snow_snowstorm) {	//если метель
			obj.snow_startSpd = random_range(5, 15);
			obj.snow_startDir = t + irandom_range(-60, 60);
		}
		obj.snow_group = i;
		//выбираю спрайт снежинки
		obj.sprite_index = snow_sprFlake[irandom_range(0, array_length(snow_sprFlake) - 1)];
		var t = random_range(0.2, 1);
		if (snow_snowstorm) {	//если метель
			t = 0.4;
		}
		obj.image_xscale = t;
		obj.image_yscale = t;
		
		Object6.tcnt1++;
		
		//увеличиваем количество снежинок в каждой группе
		snow_nowCnt[i]++;
	}
}