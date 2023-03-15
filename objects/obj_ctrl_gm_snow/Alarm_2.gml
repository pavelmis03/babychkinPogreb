/// @description Ветеррр!

//сколько продлится порыв ветра (от него зависит насколько сильным будет ветер)
//чем короче, тем сильнее
if (snow_isWind) {	//если был ветер, делаем перерыв, возвращая направление и скорость основного направления
	var tTime = irandom_range(5, 20);
	for (var i = 0; i < array_length(snow_groupParamsCurr); i++) {
		snow_groupParamsCurr[i] = snow_groupParamsMain[i];
	}
} else {
	var tTime = irandom_range(1, 5);

	//проходим по группам и меняем им параметры скорости и направления 
	var tSpd = random_range(0.5, 1.6 * clamp(4 - tTime / 1.25, 0.8, 4));	//основной ветер
	var tDir = random_range(5, 60 * clamp(3 - tTime / 1.67, 0.8, 3));

	for (var i = 0; i < array_length(snow_groupParamsCurr); i++) {
		//меняем направление не всем группам, а большинству
		if (random(10) < 3) {
			//в 50% случаев меняем направление в отрицательную сторону
			if (irandom(1)) {
				tDir *= -1;	
			}
			//случайные скорость и направление для каждой группы
			var tS = random_range(tSpd - tSpd * 0.30, tSpd * 1.30);
			var tD = random_range(tDir - tDir * 0.30, tDir * 1.30);
			snow_groupParamsCurr[i] = [tS, tD];
		}
	}
}

alarm[2] = tTime * room_speed;	//ветер!