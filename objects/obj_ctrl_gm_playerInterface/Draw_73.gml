/// @description интерфейс игрока
// !!!!!!!!!!ПРИВЯЗКА ИДЕТ В ПРОЦЕНТАХ ОТ ВИДА!!!!!!!!!!!!!

// переменные вида для привязки к нему интефейса
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);
var ctrlStat = obj_ctrl_gm_playerStatus;
var ctrlInv = obj_ctrl_gm_inv;
var ctrlEqu = obj_ctrl_gm_equ;
var ctrlBuh = obj_ctrl_gm_buh;
var tmap = { x: view_x, w: view_w, y: view_y, h: view_h };	// структура параметров вида для функции отображения параметров персонажа

// если интерфейс активирован
if (interface_on) {
	
		
	// ИНТЕРФЕЙС ИГРОКА
	draw_sprite(spr_gm_bg_playerInterface, image_index, view_x, view_y);
	
	draw_set_font(fnt_gm_cmn_14B);
	draw_set_color(c_white);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	
	// коэффициенты, чтобы легко подвинуть все значения
	var coefx = 0;	
	var coefy = 0;
	
	draw_set_color(c_white);
	draw_text(view_x + view_w * 0.17, view_y + view_h * 0.02, "ХАРАКТЕРИСТИКИ ЛЕОНИДА: ");
	
	// силы для быстрого бега
	
	scr_interface_playerParam(tmap, (coefx + 0.17), (coefy + 0.054), "Дыхалка: ", c_orange, ctrlStat.player_runPower);
	
	// текстовые жизни (цвет зависит от остатка)
	draw_set_color(c_lime);		
	if (ctrlStat.hp < 900) {draw_set_color(c_blue)}
	if (ctrlStat.hp < 800) {draw_set_color(c_green)}
	if (ctrlStat.hp < 700) {draw_set_color(c_yellow)}
	if (ctrlStat.hp < 500) {draw_set_color(c_orange)}
	if (ctrlStat.hp < 250) {draw_set_color(c_red)}
	
	// числовые параметры
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.135), "Здоровье: " + string(round(ctrlStat.hp)));
		
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.18), "Деревянные: ");
	var tcash = obj_ctrl_gm_equ.equ_cash;
	if (tcash < 50) {
		draw_set_color(c_red);
	}
	// валюта в рублях
	draw_text(view_x + view_w * (coefx + 0.17) + string_width("Деревянные: "), view_y + view_h * (coefy + 0.18), string(round(tcash)) + "₽");
	
	// просто по приколу
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.205), "Капуста: ");
	draw_set_color(c_green);
	draw_text(view_x + view_w * (coefx + 0.17) + string_width("Капуста: "), view_y + view_h * (coefy + 0.205), "000$");
	draw_set_color(c_white);
	draw_set_font(fnt_gm_cmn_10B);
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.205), "\n(всегда на нуле)");
	draw_set_font(fnt_gm_cmn_14B);
	
	// вес рюкзака
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.245), "Вес рюкзака: " + string(round(ctrlInv.inv_weight)) + "/" +  + string(round(ctrlInv.inv_maxWeight)));
		
	// еда 
	scr_interface_playerParam(tmap, (coefx + 0.29), (coefy + 0.054), "Пища: ", c_maroon, ctrlStat.player_food);
		
	// вода
	scr_interface_playerParam(tmap, (coefx + 0.29), (coefy + 0.115), "Вода: ", c_navy, ctrlStat.player_water);
	
	// Тепло 
	scr_interface_playerParam(tmap, (coefx + 0.29), (coefy + 0.176), "Тепло: ", c_aqua, ctrlStat.player_temp);
	
	// Шиза 
	scr_interface_playerParam(tmap, (coefx + 0.29), (coefy + 0.237), "Шиза: ", c_dkgrey, ctrlStat.player_crazy);
	
	// ИНФОРМАЦИЯ О СНАРЯЖЕНИИ И БОЕПРИПАСАХ (здесь выводятся предметы, которые лежат в ячейках инвентаря снаряжения а-ля быстрые клавиши)
	var coefx1 = 0;
	var coefy1 = 0;
	
	draw_set_color(c_white);
	draw_text(view_x + view_w * 0.007, view_y + view_h * 0.02, "ОРУЖИЕ:");

	// название и количество оружия - массив ["name", cnt]
	var wpn1 = ctrlEqu.equ_map_equ[?"Основное оружие"];
	var wpn2 = ctrlEqu.equ_map_equ[?"Вспомогательное оружие"];
	var wpn3 = ctrlEqu.equ_map_equ[?"Пистолет"];
	var wpn4 = ctrlEqu.equ_map_equ[?"Снаряга1"];
	var wpn5 = ctrlEqu.equ_map_equ[?"Снаряга2"];
	var wpn6 = ctrlEqu.equ_map_equ[?"Бронежилет"];
	// количество патронов (из константного получаем, 
	// какие патроны соответствуют данному оружию и потом их количество по имени патронов)
	var p1 = ctrlEqu.equ_map_patrons[?global.CONST_MAP_WEAPON[?wpn1[0]][8]];
	var p2 = ctrlEqu.equ_map_patrons[?global.CONST_MAP_WEAPON[?wpn2[0]][8]];
	var p3 = ctrlEqu.equ_map_patrons[?global.CONST_MAP_WEAPON[?wpn3[0]][8]];
	
	// ОСНОВНОЕ ОРУЖИЕ
	scr_interface_drawWpn(tmap, (coefx + 0.007), (coefy + 0.05), "Основное оружие", wpn1, ctrlEqu.equ_wpn_act, p1, 20/*заглушка на прочность*/);
	// ВСПОМОГАТЕЛЬНОЕ ОРУЖИЕ
	scr_interface_drawWpn(tmap, (coefx + 0.007), (coefy + 0.145), "Вспомогательное оружие", wpn2, ctrlEqu.equ_wpn_act, p2, 20/*заглушка на прочность*/);
	// ПИСТОЛЕТ
	scr_interface_drawWpn(tmap, (coefx + 0.007), (coefy + 0.240), "Пистолет", wpn3, ctrlEqu.equ_wpn_act, p3, 20/*заглушка на прочность*/);
	// СНАРЯЖЕНИЕ 
	draw_set_color(c_white);
	draw_text(view_x + view_w * (coefx + 0.17), view_y + view_h * (coefy + 0.275), "Снаряга: ");	
	// ячейка 1
	scr_interface_drawEqu(tmap, (coefx + 0.17), (coefy + 0.30), "Снаряга1", wpn4, ctrlEqu.equ_wpn_act, spr_ico_equEmpty);
	// ячейка 2
	scr_interface_drawEqu(tmap, (coefx + 0.21), (coefy + 0.30), "Снаряга2", wpn5, ctrlEqu.equ_wpn_act, spr_ico_equEmpty);
	
	// БРОНИК
	temp_spr = global.CONST_MAP_CLOTHES[?wpn6[0]][7];
	scr_interface_drawEqu(tmap, (coefx + 0.25), (coefy + 0.30), "Бронежилет", wpn6, "", spr_ico_bulletproofEmpty);
	
	if (ctrlEqu.equ_map_equ[?"Бронежилет"][0] != "") {
		// информация про прочность броника
		draw_set_font(fnt_gm_cmn_10B);
		var t = ctrlEqu.equ_map_equ[?"Бронежилет"][2][0][1];	// прочность
		draw_text(view_x + view_w * (coefx + 0.25), view_y + view_h * (coefy + 0.36), "Прочность: " + string(t) + "%");
		draw_set_font(fnt_gm_cmn_14B);
	}
	
}

// этот if - костыль, не трогай) (дело в том, что жизни должны рисоваться, независимо от того, открыт интерфейс или скрыт)
if ((visible == 1) and (player_obj.visible)) {		// если персонаж в буханке, то жизни не нужны (он в буханке невидимый)
	// жизни
	draw_set_color(c_white);
	draw_rectangle(player_obj.x - 56, player_obj.y - 37, player_obj.x + 56, player_obj.y - 54, true);
	draw_rectangle_color(player_obj.x - 54, player_obj.y - 39, player_obj.x + 54, player_obj.y - 52, c_red, c_lime, c_lime, c_red, false);
	draw_set_color(c_black);
	draw_rectangle(player_obj.x - 54 + (ctrlStat.hp) / 10, player_obj.y - 39, player_obj.x + 54, player_obj.y - 52, false);
}

// если интерфейс открыт
if (interface_on) {
	// перемещаю стрелочку в угол открытого инвентаря
	x = view_x + sprite_get_width(spr_gm_bg_playerInterface) - sprite_get_width(sprite_index);
	y = view_y + sprite_get_height(spr_gm_bg_playerInterface) - sprite_get_height(sprite_index);
	image_index = 1;	// переворачиваю стрелочку
} else {
	// перемещаем стрелочку в угол экрана
	x = view_x;
	y = view_y;
	image_index = 0;	// переворачиваю обратно
}

// собственный спрайт (стрелочка инвентаря)
draw_self();


// БУХАНКА
if (instance_exists(obj_buh)) {	// если буханка существует и заведена
	if (obj_buh.buh_playerIn) {	// если персонаж внутри
		draw_set_font(fnt_menu_jrn_txt);
		// интерфейс буханки
		draw_sprite(spr_gm_bg_playerInterfaceBuh, image_index, view_x, view_y);
		// стрелки
		// аккумулятор (12.4 - минимальное нопряжение, 14 - обычно максимальное)
		draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 424, view_y + 981, 1, 1, -120 / 60 * (draw_buh_battery + 12.4), c_white, 1);
		// масло
		draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 624, view_y + 981, 1, 1, 150 - 90 - (120 / 6) * draw_buh_oil, c_white, 1);
		// показатели, которые работают только когда машина заведена
		if (scr_arr_findEl([1, 3], obj_buh.buh_status, 1) != -1) {	
			// температура двигателя (+40 - потому что нормальная температура охл. жидкости 80 градусов, но начинаем считать уже с 40 (медленно растет в таймере))
			// переменная температуры должна быть постоянной и расти, поэтому рандом добавил сюда, чтобы не создавать
			// еще одну переменную, поэтому нужно условие
			draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 831, view_y + 981, 1, 1, 135 - 90 - (90 / 80) * (draw_buh_temp + 40 /*+ irandom_range(-3, 3) папа сказал, что температура не дергаетяся)*/), c_white, 1);
			
			// топливо
			if (ctrlBuh.buh_fuel <= 7) {	// если топлива мало, рисуем моргающий бачок
				draw_sprite_ext(spr_buh_fuel, draw_buh_fuelWarning, view_x + 1028, view_y + 1031, 1, 1, 0, c_white, 1);
				draw_buh_fuelWarning = (draw_buh_fuelWarning + 1 / fps) mod 2;	// так скорость изменения будет 1 кадр в секунду, а после второго кадра мы начинаем сначала
			}
			draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 1031, view_y + 981, 1, 1, 150 - 90 - (120 / 77) * ctrlBuh.buh_fuel, c_white, 1);	
		} else {	// если не заведены, то просто на нуле
			draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 831, view_y + 981, 1, 1, 135 - 90, c_white, 1);
			draw_sprite_ext(spr_buh_arrSmall, image_index, view_x + 1031, view_y + 981, 1, 1, 150 - 90, c_white, 1);	
		}
		// подсказки по передаче
		var t = 0;	// номер картинки подсказки (0 - пустая)
		if (scr_arr_findEl([1, 3], obj_buh.buh_status, 1) != -1) {
			if (obj_buh.buh_transmissionNeed > obj_buh.buh_transmission) { // требуемая передача
				t = 1;
			} 
			if (obj_buh.buh_transmissionNeed < obj_buh.buh_transmission) { 
				t = 2;
			}
		}
		// если передача == 5, то это реверс
		if (obj_buh.buh_transmission == 5) { 
			t = 3;
		}
		// если передача == 0, то это нейтраль
		if (obj_buh.buh_transmission == 0) { 
			t = 4;
		}
		// рисую сам спрайт подсказки
		draw_sprite_ext(spr_buh_transmissionInfo, t, view_x + 1350, view_y + 962, 1, 1, 0, c_white, 1);
		// подсказка по ручнику
		if (obj_buh.buh_handbrake) {  // если ручник включен, показываем это
			draw_sprite_ext(spr_buh_handbrake, 0, view_x + 1220, view_y + 962, 1, 1, 0, c_white, 1);
		} else {
			draw_sprite_ext(spr_buh_handbrake, 1, view_x + 1220, view_y + 962, 1, 1, 0, c_white, 1);
		}
		// скорость
		draw_sprite_ext(spr_buh_arrSpd, image_index, view_x + 1300, view_y + 922, 1, 1, 225 - 90 - (270 / 120) * (abs(obj_buh.speed) * 3.6/*км/ч*/), c_white, 1);
		
		// коэффициенты, чтобы легко подвинуть все значения
		var coefx2 = 0;	
		var coefy2 = 0;
		
		draw_set_color(c_white);
		draw_set_halign(fa_left);
		/*
		// передача
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
		// банкой пива, катающейся по приборке, показываем угол поворота руля
		draw_sprite_ext(spr_buh_beer, 0, view_x + 831 + obj_buh.buh_rotAngle / 2, view_y + 792, 1, 1, 0, c_white, 1);
		// расход
		draw_text(view_x + view_w * (coefx2 + 0.515), view_y + view_h * (coefy2 + 0.94), "Расход: " + string(obj_buh.buh_fuelConsumption));
		// износ
		// draw_text(view_x + view_w * (coefx2 + 0.19), view_y + view_h * (coefy2 + 0.795), "Износ/сек: " + string(obj_buh.buh_decomposition + obj_buh.buh_decomposition1));
		var td = clamp(obj_buh.buh_decomposition + obj_buh.buh_decomposition1, 0, 1);
		draw_sprite_ext(spr_buh_arrVertical, 0, view_x + 790 + td * 290, view_y + 820, 1, 1, 0, c_white, 1);
		// прочность
		draw_text(view_x + view_w * (coefx2 + 0.19), view_y + view_h * (coefy2 + 0.815), "Прочность: ");
		draw_rectangle(view_x + view_w * (coefx2 + 0.25), view_y + view_h * (coefy2 + 0.8), view_x + view_w * (coefx2 + 0.358), view_y + view_h * (coefy2 + 0.815), true);
		draw_set_color(c_purple);
		draw_rectangle(view_x + view_w * (coefx2 + 0.2515), view_y + view_h * (coefy2 + 0.803), view_x + view_w * (coefx2 + 0.252) + ctrlBuh.hp / 25, view_y + view_h * (coefy2 + 0.812), false);
		draw_set_color(c_white);	// отображаю жизни числовым значением
		draw_text(view_x + view_w * (coefx2 + 0.295), view_y + view_h * (coefy2 + 0.815), string(ctrlBuh.hp));	// число
		
		scr_interface_mileageCalc();
		
		for (var i = 0; i < 6; i++) {	// отображение каринок цифр 
			draw_sprite(spr_buh_num, draw_buh_mileage[5 - i] * 4, view_x + 1250 + i * sprite_get_width(spr_buh_num), view_y + 994);
		}
	}
}
