/// @description интерфейс игрока
//!!!!!!!!!!ПРИВЯЗКА ИДЕТ В ПРОЦЕНТАХ ОТ ВИДА!!!!!!!!!!!!!

//переменные вида для привязки к нему интефейса
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

//если интерфейс активирован
if (interface_on) {
		
	//ИНТЕРФЕЙС ИГРОКА
	draw_sprite(spr_gm_bg_playerInterface, image_index, view_x, view_y);
	
	draw_set_font(fnt_gm_cmn);
	draw_set_color(c_white);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	//коэффициенты, чтобы легко подвинуть все значения
	var coefx = 0;	
	var coefy = 0;
	
	draw_set_color(c_white);
	draw_text(view_x + view_w * 0.17, view_y + view_h * 0.04, "ХАРАКТЕРИСТИКИ ЛЕОНИДА: ");
	
	//силы для быстрого бега
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.074), "Дыхалка: ");
	draw_rectangle(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.100), view_x + view_w * (coefx + 0.226), view_y + view_h * (coefy + 0.115), true);
	draw_set_color(c_orange);
	draw_rectangle(view_x + view_w * (coefx + 0.1715), view_y + view_h * (coefy + 0.103), view_x + view_w * (coefx + 0.172) + obj_ctrl_gm_playerStatus.player_runPower, view_y + view_h * (coefy + 0.112), false);
	
	//текстовые жизни (цвет зависит от остатка)
	draw_set_color(c_lime);		
	if (obj_ctrl_gm_playerStatus.hp < 900) {draw_set_color(c_blue)}
	if (obj_ctrl_gm_playerStatus.hp < 800) {draw_set_color(c_green)}
	if (obj_ctrl_gm_playerStatus.hp < 700) {draw_set_color(c_yellow)}
	if (obj_ctrl_gm_playerStatus.hp < 500) {draw_set_color(c_orange)}
	if (obj_ctrl_gm_playerStatus.hp < 250) {draw_set_color(c_red)}
	
	//числовые параметры
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.155), "Твои HP: " + string(round(obj_ctrl_gm_playerStatus.hp)));
		
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.20), "Деревянные: " + string(round(100 /*заглушка (должны быть рубли)*/)) + "₽");
	draw_set_color(c_green);
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.225), "Капуста: 000$\n(всегда на нуле)");
		
	//еда 
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.29), view_y + view_h * (coefy + 0.074), "Пища: ");
	draw_rectangle(view_x + view_w * (coefx + 0.29), view_y + view_h * (coefy + 0.100), view_x + view_w * (coefx + 0.347), view_y + view_h * (coefy + 0.115), true);
	draw_set_color(c_maroon);
	draw_rectangle(view_x + view_w * (coefx + 0.2915), view_y + view_h * (coefy + 0.103), view_x + view_w * (coefx + 0.292) + 50/*заглушка (должны быть силы для бега)*/, view_y + view_h * (coefy + 0.112), false);
		
	//вода
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.29), view_y + view_h * (coefy + 0.135), "Вода: ");
	draw_rectangle(view_x + view_w * (coefx + 0.29), view_y + view_h * (coefy + 0.161), view_x + view_w * (coefx + 0.347), view_y + view_h * (coefy + 0.176), true);
	draw_set_color(c_navy);
	draw_rectangle(view_x + view_w * (coefx + 0.2915), view_y + view_h * (coefy + 0.164), view_x + view_w * (coefx + 0.292) + 50/*заглушка (должны быть силы для бега)*/, view_y + view_h * (coefy + 0.173), false);
	
	//Тепло 
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.29), view_y + view_h * (coefy + 0.196), "Тепло: ");
	draw_rectangle(view_x + view_w * (coefx + 0.29), view_y + view_h * (coefy + 0.222), view_x + view_w * (coefx + 0.347), view_y + view_h * (coefy + 0.237), true);
	draw_set_color(c_aqua);
	draw_rectangle(view_x + view_w * (coefx + 0.2915), view_y + view_h * (coefy + 0.225), view_x + view_w * (coefx + 0.292) + 50/*заглушка (должны быть силы для бега)*/, view_y + view_h * (coefy + 0.233), false);
	
	//Шиза 
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.29), view_y + view_h * (coefy + 0.257), "Шиза: ");
	draw_rectangle(view_x + view_w * (coefx + 0.29), view_y + view_h * (coefy + 0.283), view_x + view_w * (coefx + 0.347), view_y + view_h * (coefy + 0.298), true);
	draw_set_color(c_dkgray);
	draw_rectangle(view_x + view_w * (coefx + 0.2915), view_y + view_h * (coefy + 0.286), view_x + view_w * (coefx + 0.292) + 50/*заглушка (должны быть силы для бега)*/, view_y + view_h * (coefy + 0.295), false);
	
	//ИНФОРМАЦИЯ О СНАРЯЖЕНИИ И БОЕПРИПАСАХ (здесь выводятся предметы, которые лежат в ячейках инвентаря снаряжения а-ля быстрые клавиши)
	var coefx1 = 0;
	var coefy1 = 0;
	
	draw_set_color(c_white);
	draw_text(view_x + view_w * 0.007, view_y + view_h * 0.04, "ОРУЖИЕ:");
	//ПИСТОЛЕТ
	var temp_spr = spr_ico_AK;	//заменить перменную при последующей разработке на более соответствующую выполняемой функции
	var cl = c_blue;
	
	//ЕСЛИ ДАННОЕ ОРУЖИЕ ВЫБРАНО СЕЙЧАС
	//if () {
		//cl = c_yellow;
	//}
	draw_set_color(cl);
	draw_text(view_x + view_w * (coefx1 + 0.007), view_y + view_h * (coefy1 + 0.078) + sprite_get_height(temp_spr), "Патроны: ");
	//if ( <= обойма) {
	//	draw_set_color(c_orange);
	//}
	//if ( == 0) {
	//	draw_set_color(c_red);
	//}
	draw_text(view_x + view_w * (coefx1 + 0.007) + string_width("Патроны: "), view_y + view_h * (coefy1 + 0.078) + sprite_get_height(temp_spr), string(10) /*заглушка*/ + "шт");
	
	draw_set_color(cl);
	draw_text(view_x + view_w * (coefx1 + 0.007), view_y + view_h * (coefy1 + 0.105) + sprite_get_height(temp_spr), "Износ: ");
	//ЕСЛИ ИЗНОС БОЛЬШЕ 50%
	//if ( > 50) {
		//draw_set_color(c_orange);
	//}
	//if ( > 80) {
		//draw_set_color(c_red);
	//}
	draw_text(view_x + view_w * (coefx1 + 0.007) + string_width("Износ: "), view_y + view_h * (coefy1 + 0.105) + sprite_get_height(temp_spr), string(20) /*заглушка*/ + "%");
	//иконнка оружия
	draw_sprite(temp_spr, image_index, view_x + view_w * (coefx1 + 0.007), view_y + view_h * (coefy1 + 0.074));
		
	//ОСНОВНОЕ ОРУЖИЕ
		
	//ВСПОМОГАТЕЛЬНОЕ ОРУЖИЕ
}

//этот if - костыль, не трогай) (дело в том, что жизни должны рисоваться, независимо от того, открыт интерфейс или скрыт)
if ((visible == 1) and (player_obj.visible)) {		//если персонаж в буханке, то жизни не нужны (он в буханке невидимый)
	//жизни
	draw_set_color(c_white);
	draw_rectangle(player_obj.x - 56, player_obj.y - 37, player_obj.x + 56, player_obj.y - 54, true);
	draw_rectangle_color(player_obj.x - 54, player_obj.y - 39, player_obj.x + 54, player_obj.y - 52, c_red, c_lime, c_lime, c_red, false);
	draw_set_color(c_black);
	draw_rectangle(player_obj.x - 54 + (obj_ctrl_gm_playerStatus.hp) / 10, player_obj.y - 39, player_obj.x + 54 , player_obj.y - 52, false);
}

//если интерфейс открыт
if (interface_on) {
	//перемещаю стрелочку в угол открытого инвентаря
	x = view_x + sprite_get_width(spr_gm_bg_playerInterface) - sprite_get_width(sprite_index);
	y = view_y + sprite_get_height(spr_gm_bg_playerInterface) - sprite_get_height(sprite_index);;
} else {
	//перемещаем стрелочку в угол экрана
	x = view_x;
	y = view_y;
}

//собственный спрайт (стрелочка инвентаря)
draw_self();


//БУХАНКА
if (instance_exists(obj_buh)) {	//если буханка существует и заведена
	if (obj_buh.buh_playerIn) {		
		//интерфейс буханки
		draw_sprite(spr_gm_bg_playerInterfaceBuh, image_index, view_x, view_y);
		//стрелки
		//аккумулятор (12.4 - минимальное нопряжение, 14 - обычно максимальное)
		draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 424, view_y + 981, 1, 1, -120 / 60 * (draw_buh_battery + 12.4), c_white, 1);
		//масло
		draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 624, view_y + 981, 1, 1, 150 - 90 - (120 / 6) * draw_buh_oil, c_white, 1);
		//температура двигателя (+40 - потому что нормальная температура охл. жидкости 80 градусов, но начинаем считать уже с 40 (медленно растет в таймере))
		if (scr_arr_fingEl([1, 3], obj_buh.buh_status, 1) != -1) {	
			//переменная температуры должна быть постоянной и расти, поэтому рандом добавил сюда, чтобы не создавать
			//еще одну переменную, поэтому нужно условие
			draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 831, view_y + 981, 1, 1, 135 - 90 - (90 / 80) * (draw_buh_temp + 40 /*+ irandom_range(-3, 3) папа сказал, что температура не дергаетяся)*/), c_white, 1);
		} else {	//если не заведены, то просто на нуле
			draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 831, view_y + 981, 1, 1, 135 - 90, c_white, 1);
		}
		//топливо
		draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 1031, view_y + 981, 1, 1, 150 - 90 - (120 / 77) * obj_ctrl_gm_buh.buh_fuel, c_white, 1);
		//подсказки по передаче
		var t = 0;	//номер картинки подсказки (0 - пустая)
		if (scr_arr_fingEl([1, 3], obj_buh.buh_status, 1) != -1) {
			if (obj_buh.buh_transmissionNeed > obj_buh.buh_transmission) { //требуемая передача
				t = 1;
			} 
			if (obj_buh.buh_transmissionNeed < obj_buh.buh_transmission) { 
				t = 2;
			}
		}
		//если передача == 5, то это реверс
		if (obj_buh.buh_transmission == 5) { 
			t = 3;
		}
		//если передача == 0, то это нейтраль
		if (obj_buh.buh_transmission == 0) { 
			t = 4;
		}
		//рисую сам спрайт подсказки
		draw_sprite_ext(spr_buh_transmissionInfo, t, view_x + 1350, view_y + 962, 1, 1, 0, c_white, 1);
		//подсказка по ручнику
		if (obj_buh.buh_handbrake) {  //если ручник включен, показываем это
			draw_sprite_ext(spr_buh_handbrake, 0, view_x + 1220, view_y + 962, 1, 1, 0, c_white, 1);
		} else {
			draw_sprite_ext(spr_buh_handbrake, 1, view_x + 1220, view_y + 962, 1, 1, 0, c_white, 1);
		}
		//скорость
		draw_sprite_ext(spr_buh_arrSpd, image_index, view_x + 1300, view_y + 922, 1, 1, 225 - 90 - (270 / 120) * (abs(obj_buh.speed) * 3.6/*км/ч*/), c_white, 1);
		
		//коэффициенты, чтобы легко подвинуть все значения
		var coefx2 = 0;	
		var coefy2 = 0;
		
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		/*
		//передача
		switch (obj_buh.buh_transmission) {
			case 0: 
				draw_text(view_x + view_w * (coefx2 + 0.365), view_y + view_h * (coefy2 + 0.815), "Передача: N");
			break;
			case 5: 
				draw_text(view_x + view_w * (coefx2 + 0.365), view_y + view_h * (coefy2 + 0.815), "Передача: R");
			break;
			default:
				draw_text(view_x + view_w * (coefx2 + 0.365), view_y + view_h * (coefy2 + 0.815), "Передача: " + string(obj_buh.buh_transmission));
		}
		*/
		//расход
		draw_text(view_x + view_w * (coefx2 + 0.475), view_y + view_h * (coefy2 + 0.953), "Расход: " + string(obj_buh.buh_fuelConsumption));
		//износ
		draw_text(view_x + view_w * (coefx2 + 0.19), view_y + view_h * (coefy2 + 0.795), "Износ/сек: " + string(obj_buh.buh_decomposition + obj_buh.buh_decomposition1));
		//прочность
		draw_text(view_x + view_w * (coefx2 + 0.19), view_y + view_h * (coefy2 + 0.815), "Прочность: ");
		draw_rectangle(view_x + view_w * (coefx2 + 0.25), view_y + view_h * (coefy2 + 0.8), view_x + view_w * (coefx2 + 0.358), view_y + view_h * (coefy2 + 0.815), true);
		draw_set_color(c_purple);
		draw_rectangle(view_x + view_w * (coefx2 + 0.2515), view_y + view_h * (coefy2 + 0.803), view_x + view_w * (coefx2 + 0.252) + obj_ctrl_gm_buh.hp / 25, view_y + view_h * (coefy2 + 0.812), false);
		
		scr_interface_mileageCalc();
		
		for (var i = 0; i < 6; i++) {	//отображение каринок цифр 
			draw_sprite(spr_buh_num, draw_buh_mileage[5 - i] * 4, view_x + 1250 + i * sprite_get_width(spr_buh_num), view_y + 994);
		}
	}
}
