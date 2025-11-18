/// @description отрисовка

// параметры персонажа
var tx = room_width * 0.015, ty = room_height * 0.3;
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fnt_set);
draw_set_color(c_white);

draw_text(tx, ty, "Параметры персонажа: ");
draw_text(tx, ty + string_height("З") + 4, "Здоровье: " + string(round(obj_ctrl_gm_playerStatus.hp)));
draw_text(tx, ty + (string_height("З") + 4) * 2, "Силы для бега: " + string(round(obj_ctrl_gm_playerStatus.player_runPower)));
draw_text(tx, ty + (string_height("З") + 4) * 3, "Пища: " + string(round(obj_ctrl_gm_playerStatus.player_food)));
draw_text(tx, ty + (string_height("З") + 4) * 4, "Вода: " + string(round(obj_ctrl_gm_playerStatus.player_water)));
draw_text(tx, ty + (string_height("З") + 4) * 5, "Тепло: " + string(round(obj_ctrl_gm_playerStatus.player_temp)));
draw_text(tx, ty + (string_height("З") + 4) * 6, "Шиза: " + string(round(obj_ctrl_gm_playerStatus.player_crazy)));
draw_text(tx, ty + (string_height("З") + 4) * 7, "Осталось места: " + string(round(inv_freeCell)) + "/" + string(maxRow * maxCol * maxPage));
draw_text(tx, ty + (string_height("З") + 4) * 8, "Вес рюкзака: " + string(round(obj_ctrl_gm_inv.inv_weight)) + "/" + string(obj_ctrl_gm_inv.inv_maxWeight) + "кг");
if (inv_type == "sellerInv") {	// если контрагент - продавец
	draw_text(tx, ty + (string_height("З") + 4) * 10, "Деревянные: " + string(round(obj_ctrl_gm_equ.equ_cash)) + "₽");
}

// надпись ,,страница,, для рюкзака
var tx = room_width * 0.22, ty = room_height * 0.71;
draw_text(tx, ty, "Страница: " + string(page) + "/" + string(ceil(maxPage)));

if (scr_arr_findEl(["sellerInv", "boxInv", "buhInv"], inv_type, 1) != -1) {	// если инвентари с перелистыванием
	
	if (maxPage_other > 1) {
		draw_text(room_width - tx - string_width("Страница: 3/3"), ty, "Страница: " + string(page_other) + "/" + string(ceil(maxPage_other)));
	}
	
	// параметры инвентаря-контрагента
	tx = room_width * (1 - 0.02) - string_width("места: 100/100");
	ty = room_height * 0.3;
	
	if ((inv_type == "buhInv") or (inv_type == "boxInv")) {	// если контрагент - буханка или коробка
		draw_text(tx, ty + (string_height("З") + 4) * 7, "Осталось\n    места: " + string(round(inv_freeCell_other)) + "/" + string(ctrl.maxEl_other));
		var ttext = "/" + string(round(inv_maxWeight_other));	// максимальный вес
		if (inv_type == "boxInv") {	// у коробок нет максимального веса
			ttext = "";
		}
		draw_text(tx, ty + (string_height("З") + 4) * 9, "Общий вес: " + string(round(inv_weight_other)) + ttext);
	}
	
	if (inv_type == "sellerInv") {	// если контрагент - продавец, выводим его деньги
		draw_text(tx, ty + (string_height("З") + 4) * 11, "Деревянные: " + string(round(0 /*"_средства_"*/)) + "₽");
	}
}

// название инвентаря-контрагента справа над ячейками (+ 10 - отступ между ячейками)
tx = startX_other + (cellW + 10) * maxCol - string_width(inv_name) - 10;// - 10 - после последней ячейки не отступаем
ty = startY_other - string_height(inv_name) - room_height * 0.015;
draw_set_font(fnt_set);
draw_text(tx, ty, inv_name);	// заголовок инвентаря-контрагента

// диалоги
tx = room_width * 0.016;
ty = room_height * 0.04;
draw_sprite(spr_ico_people_Leonid, image_index, tx, ty);	// иконка леонида
if (inv_type == "boxInv") {	// если контрагент - коробка
	// иконка коробки
	draw_sprite(spr_ico_obj_box, inv_ico_ind_other, room_width - tx - sprite_get_width(spr_ico_obj_box), ty);
}

if (inv_type == "sellerInv") {	// если контрагент - продавец
	// иконка продавца
	draw_sprite(spr_ico_people_Seller, inv_ico_ind_other, room_width - tx - sprite_get_width(spr_ico_people_Seller), ty);
}

if (inv_type == "buhUpgradeInv") {	// если контрагент - буханка
	// иконка буханки
	draw_sprite(spr_ico_obj_Buh, inv_ico_ind_other, room_width - tx - sprite_get_width(spr_ico_obj_Buh), ty);
}






















