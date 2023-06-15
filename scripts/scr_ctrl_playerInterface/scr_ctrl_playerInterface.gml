/// @function scr_interface_mileageCalc();
/// @description меняет массив цифр (к которым привязаны картинки пробега)

function scr_interface_mileageCalc() {
	//пробег
	var t = round(obj_ctrl_gm_buh.buh_mileage);
	if (abs(draw_buh_mileageLast - t) > 0.1) {	//если пробег увеличился, то меняем наш, пока: ...
		var tt = [];	//временный массив
		for (var i = 0; i < 6; i++) {	//разбиваем новое значение пробега на цифры
			array_push(tt, t % 10);
			t = floor(t / 10);
		}	
		for (var i = 0; i < 6; i++) {	
			if (abs(draw_buh_mileage[i] - tt[i]) > 0.1) {
				//(4 кадра нужно поменять со скоростью 5 кадров / сек)
				//прибавляем к нашим цифрам, пока не достигнем примерно нового пробега
				draw_buh_mileage[i] += 1 / room_speed * 5;	
			}
		}
		draw_buh_mileageLast += 1 / room_speed * 5;	//параллельно массиву обновляем и переменную пробега интерфейса
	} else {
		if (draw_buh_mileageLast != t) {	//если мы уже почти дошли до нового значения пробега
			draw_buh_mileageLast = t;		//назначаем точное значение
			for (var i = 0; i < 6; i++) {	//обновляем массив
				draw_buh_mileage[i] = t % 10;
				t = floor(t / 10);
			}
		}
	}
}
