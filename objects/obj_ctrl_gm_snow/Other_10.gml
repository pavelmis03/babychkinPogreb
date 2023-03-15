/// @description init

alarm[0] = snow_time * room_speed;	//время, в течение которого идет метель
//изменение количества снежинок с течением времени и генерация их
alarm[1] = room_speed / 4;	
if (!snow_snowstorm) {	//во время метели ветер один
	alarm[2] = 10 * room_speed;	//ветер)
}
//изначальное количество снежинок
snow_maxCnt = snow_numOfSnowflake[0];

//заполняю массивы по умолчанию
for (var i = 0; i < snow_groupCnt; i++) {
	snow_nowCnt[i] = 0;
		//[можитель speed, прибавка к direction]
	snow_groupParamsMain[i] = [random_range(0.2, 1.4), irandom_range(-45, 45)];
	if (!snow_snowstorm) {
		snow_groupParamsCurr[i] = [random_range(0.2, 1.4), 0];
	} else {
		snow_groupParamsCurr[i] = [1, 0];
	}
}

init = true;