/// @description

var signSpd = sign(speed);
player_obj = scr_player_type();

if (!init) {
	event_user(0);	
}

//определяем способ взаимодействия с игроком по направлению и близости к буханке
scr_buh_chechPlayerDir();

image_angle = direction;

if (obj_ctrl_gm_buh.buh_broke != 2) {	//если она не сломана
	//движение
	if (speed != 0) {
		//поворот буханки не зависит от статуса буханки
		var L = 2.3;	//колесная база в метрах
		var A = abs(buh_rotAngle) / 15.4;	//угол поворота колеса в градусах
		var R = L / tan(pi * A / 180);	//радиус окружности по которой движется машина
		var t = 10;	//корректировка, чтоб красиво было
		//var l = 2 * R * pi; //длина окр
		//var T = l / (speed * 3.6);	
		//var T = l / 5;	
		//direction += 360 / T / room_speed * sign(buh_rotAngle);	
		direction += 360 / R * speed / room_speed / t * sign(buh_rotAngle);	
		
		var tt = instance_position(x, y, obj_ctrl_gm_surf);	//проверяю коллизию с поверхностью
		if (tt != noone) {	//если под нами определена поверхность
			//получаем массив параметров поверхности - параметры для буханки - износ на км 
			//делю на 100, чтобы получить в процентах, потом делю на время, за которое буханка проедет 1км при скорости (speed / 1000)км/с
			//buh_decomposition1 = 5000 * (t.surf_params[1][1] / 100) / (1 / (speed / 1000));	//линейная зависимость от скорости
			buh_decomposition1 = 5000 * (tt.surf_params[1][1] / 100) / (1 / (power(speed, 2) / 1000));		//квадратичная
		}
		
		if (buh_status != 2) {	//если мы не заглохли
			buh_status = 3;		//говорим о том, что мы движемся
			//спрайт движения
			if (sprite_index != spr_buh_drive) {
				sprite_index = spr_buh_drive;
				image_index = 0;
			}
			scr_snd_requestPlaySnd(snd_buh_idle, snd_buh_idle, 20, false);	//останавливаем звук холостого двигателя
		}
	} else {
		if (buh_status == 3) {	//если мы ехали, а скорость нулевая
			buh_status = 1;	//то просто заведеные
			scr_snd_requestPlaySnd(snd_buh_movement, snd_buh_movement, 20, false);	//останавливаем звук движения
			//запускаем спрайт на месте заведенной
			sprite_index = spr_buh_stateStarted;
			image_index = 0;
		}
		buh_decomposition = 0;
		buh_decomposition1 = 0;	//когда мы стоим, износа нет
	}

	//звук холостых оборотов
	if (buh_status == 1) {
		scr_snd_requestPlaySnd(snd_buh_idle, snd_buh_idle, 20, true);	//звук рева
	}

	//если мы едем
	if (buh_status == 3) {
		obj_ctrl_gm_buh.buh_mileage	+= (speed / 1000 / room_speed);	//пробег / 1000, потому что км/сек считаю. (км = 1/1000м)
		scr_snd_requestPlaySnd(snd_buh_movement, snd_buh_movement, 20, true);	//звук движения
	
		//автоторможение при включенных нейтрали или сцеплении	
		if ((buh_coupling) or (buh_transmission == 0)) {	//если нейтраль или сцепление
			var t = clamp(abs(speed) * 3.6 / 60, 0, 2);	//торможение об воздух на холостом ходу до 2 от скорости зависит
			var t1 = 0;
			var tt = instance_position(x, y, obj_ctrl_gm_surf);	//проверяю коллизию с поверхностью
			if (tt != noone) {	//если под нами определена поверхность
				t1 = tt.surf_params[1][0];	//торможение по поверхности
			}
			var tc = 0.15;
			if (abs(speed) * 3.6 < 1.5) {	//если едем медленнее, чем 1.5км/ч
				tc = 1;				//чтобы мы не останавливались 10 минут со скорости 1км/ч
			}
			//добавил clamp, чтобы при небольшой скорости влияние шифта и нейтрали не сказывалось так сильно
			speed -= clamp(t + t1, 0, abs(speed) * tc) / room_speed * signSpd;
			if (abs(speed) * 3.6 < 0.5) {	//округляем скорость, если она совсем маленькая
				speed = 0;
			}
		}
	
		if (buh_transmissionNeed > buh_transmission) { //если передача ниже нужной
			scr_snd_requestPlaySnd(snd_buh_engineRoar, snd_buh_engineRoar, 20, true);	//звук ревущего движка
		}
	
		//вывод подсказки об остатках топлива (сообщаем пару раз на 7+- литрах)
		if (abs(obj_ctrl_gm_buh.buh_fuel - 7) < 0.01) {
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankafuelLow1";
		}
		if (abs(obj_ctrl_gm_buh.buh_fuel - 2.5) < 0.01) {
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankafuelLow2";
		}
		//глохнем, если топливо кончилось
		if (obj_ctrl_gm_buh.buh_fuel < 0.1) {
			scr_buh_stallAction(false);	//глохнем
			obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaFuelEnd";
		}
	}

	if (buh_status != 2) {
		//зависимость требуемой передачи от скорости
		if ((speed > -3 / 3.6) and (speed < 3 / 3.6)) {	//N
			buh_transmissionNeed = 0;
		}
		if ((speed > 3 / 3.6) and (speed <= 19 / 3.6)) {	//1ая
			buh_transmissionNeed = 1;
		}
		if ((speed > 8 / 3.6) and (speed <= 40 / 3.6)) {	//2ая
			buh_transmissionNeed = 2;
		}
		if ((speed > 30 / 3.6) and (speed <= 70 / 3.6)) {	//3ая
			buh_transmissionNeed = 3;
		}
		if (speed > 55 / 3.6) {	//4ая
			buh_transmissionNeed = 4;
		}

		//расчет текущего расхода топлива
		scr_buh_calcFuelConsumption();
	
		//глохнем из-за неправильно выбранной передачи
		var arr = buh_spds[buh_transmission];	//скорости для текущей передачи
		if ((abs(speed) < abs(arr[0])) and (!buh_coupling)) {//если минимальная скорость больше текущей и не включено сцепление
			scr_buh_stallAction(true);	//даем время на исправление ситуации
		} else {
			if (audio_is_playing(snd_buh_preStall)) {	//если мы глохнем, а ситуация исправлена
				audio_stop_sound(snd_buh_preStall);
				alarm_set(1, -1);	//отключаем таймер
				buh_decomposition = 0;
			}
		}
	} else {	//если мы заглохли
		buh_fuelConsumption = 0;	//потребления нет, т.к. двигатель не работает
	
		if (audio_is_playing(snd_buh_preStall)) {	//если мы глохнем, а движок уже заглох
			audio_stop_sound(snd_buh_preStall);
			alarm_set(1, -1);	//отключаем таймер
		}
		scr_snd_requestPlaySnd(snd_buh_movement, snd_buh_movement, 20, false);	//останавливаем звук движения
	
		if (speed != 0) { //если мы заглохли, но еще не остановились
			buh_decomposition = 5000 * (abs(speed) * 3.6 / 60) / 100; //износ при торможении двигателем в зависимости от скорости (до 2%/сек)
			speed -= CONST_BUH_DEBOOST * 0.7 / room_speed * signSpd;	//торможение двигателем
		} else {
			//спрайт остановки, если только мы не вылазим из машины
			if ((sprite_index != spr_buh_state) and (sprite_index != spr_buh_getInCar)) {
				sprite_index = spr_buh_state;
				image_index = 0;
			}
			buh_decomposition = 0;	//когда мы стоим, износа нет
			buh_decomposition1 = 0;	//когда мы стоим, износа нет
			
			if (obj_ctrl_gm_buh.buh_broke == 1) {	//если буханка сломалась, когда ехала, а теперь остановилась
				obj_ctrl_gm_buh.buh_broke = 2;		//окончательно ломаем) (чтобы нельзя было сесть обратно)
			}
		}
	}

	//это ограничение не дает скорости переваливать через ноль, ни справа, ни слева, поэтому неважно, какая скорость и условия
	var t1 = speed * (1 + signSpd) / 2;	//в зависимости от знака скорости
	var t2 = speed * (1 - signSpd) / 2;	//будет clamp(speed, 0, speed) при speed > 0
											//и clamp(speed, speed, 0) при speed < 0

	speed = clamp(round(speed * 10000) / 10000, t2, t1);
	buh_decomposition = clamp(buh_decomposition, 0, 1000);	//в секунду

	//если игрок в буханке, то мы его привязываем к координатам буханки
	if (buh_playerIn) {
		player_obj.x = x;
		player_obj.y = y;
		//на всякий: так направление персонажа ни с кем не совпадет и он не сможет взаимодействовать
		player_obj.image_angle = direction + 180;	
	}
	
	obj_ctrl_gm_buh.hp -= (buh_decomposition + buh_decomposition1) / room_speed;	//износ в секунду
	obj_ctrl_gm_buh.hp = clamp(obj_ctrl_gm_buh.hp, 0, obj_ctrl_gm_buh.CONST_BUH_MAXHP);
	
	//если жизни равны нулю, мы ломаемся
	if ((obj_ctrl_gm_buh.hp == 0) and (obj_ctrl_gm_buh.buh_broke == 0)) {
		scr_buh_stallAction(false);		//глохнем
		obj_ctrl_gm_buh.buh_broke = 1;	//мы полностью сломаемся после остановки
		obj_ctrl_gm_hint.ctrl_hint_newHint = "buhankaBrokeNow";
	}
} else {
	//спрайт сломанной буханки, если еще не назначен
	if (sprite_index == spr_buh_state) {
		sprite_index = spr_buh_broke;
		image_index = 0;
	}
	//проверить
	//починить буханку можно, если вернуть ей целостность больше 70% от первоначальной целостности
	if (obj_ctrl_gm_buh.hp > 0.7 * 5000) {
		buh_status = 0;
	}
}

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}
