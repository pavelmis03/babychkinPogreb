/// @description

if (!init) {
	event_user(0);	
}

//определяем способ взаимодействия с игроком по направлению и близости к буханке
scr_buh_chechPlayerDir();

image_angle = direction;

//движение
if (speed != 0) {
	buh_status = 3;
	//спрайт движения
	if (sprite_index != spr_buh_drive) {
		sprite_index = spr_buh_drive;
		image_index = 0;
	}
	
	if (audio_is_playing(snd_buh_idle)) {	//останавливаем звук холостого двигателя
		audio_stop_sound(snd_buh_idle);
	}
	
	var L = 2.3;	//колесная база в метрах
	var A = abs(buh_rotAngle) / 15.4;	//угол поворота колеса в градусах
	var R = L / tan(pi * A / 180);	//радиус окружности по которой движется машина
	var t = 10;	//корректировка, чтоб красиво было
	//var l = 2 * R * pi; //длина окр
	//var T = l / (speed * 3.6);	
	//var T = l / 5;	
	//direction += 360 / T / room_speed * sign(buh_rotAngle);	
	direction += 360 / (R / speed) / room_speed / t * sign(buh_rotAngle);	
} else {
	if (buh_status == 3) {	//если мы ехали, а скорость нулевая
		buh_status = 1;	//то просто заведеные
		if (audio_is_playing(snd_buh_movement)) {	//останавливаем звук движения
			audio_stop_sound(snd_buh_movement);
		}
		//запускаем спрайт на месте заведенной
		sprite_index = spr_buh_stateStarted;
		image_index = 0;
	}
}

//звук холостых оборотов
if (buh_status == 1) {
	if (!audio_is_playing(snd_buh_idle)) {
		//воспроизводим звук
		obj_ctrl_snd.action = "playSnd";
		array_push(obj_ctrl_snd.sound, 20, "snd_buh_idle");
	}
}

//если мы едем
if (buh_status == 3) {
	obj_ctrl_gm_buh.buh_mileage	+= (speed / 1000 / room_speed);	//пробег / 1000, потому что км/сек считаю
	if (!audio_is_playing(snd_buh_movement)) {
		//воспроизводим звук движения
		obj_ctrl_snd.action = "playSnd";
		array_push(obj_ctrl_snd.sound, 20, "snd_buh_movement");
	}
}

//зависимость требуемой передачи от скорости
if ((speed > 0) and (speed <= 19 / 3.6)) {	//1ая
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

//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}
