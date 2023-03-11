/// @description 


draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_font(fnt_gm_hint);
draw_set_color(c_gray);

//ВЫБОР СПРАЙТА
var spr_name = sprite_get_name(sprite_index);	//в зависимости от состояния у всех терминалов одинаковое
		//начало в названии спрайтов, но конец разный в зависимости от типа терминала
var str = string_copy(spr_name, 0, 18);	//название спрайта без имени ДОЛЖНО БЫТЬ У ВСЕХ ОДНОЙ ДЛИНЫ
var str1 = string_copy(spr_name, 19, string_length(spr_name));	//имя объекта

switch (terminal_state) {
	case "destr": 
		//проверяю, что текущий спрайт не спрайт уничтоженного объекта
		if (str != "spr_terminal_destr") {
			if (sprite_exists(asset_get_index("spr_terminal_destr" + str1))) {
				//назначаю спрайт уничтоженного объекта, добавляя имя самого объекта
				sprite_index = asset_get_index("spr_terminal_destr" + str1);
			}
		}
	break;
	case "empty":
		//проверяю, что текущий спрайт не спрайт пустого объекта
		if (str != "spr_terminal_empty") { 
			if (sprite_exists(asset_get_index("spr_terminal_empty" + str1))) {
				//назначаю спрайт пустого объекта, добавляя имя самого объекта
				sprite_index = asset_get_index("spr_terminal_empty" + str1);
			}
		}
	break;
	case "reload":
		//проверяю, что текущий спрайт не спрайт перезагрузки терминала
		if (str != "spr_terminal_reld_") { 
			if (sprite_exists(asset_get_index("spr_terminal_reld_" + str1))) {
				//назначаю спрайт перезагружающегося объекта, добавляя имя самого объекта
				sprite_index = asset_get_index("spr_terminal_reld_" + str1);
			}
		}
	break;
	case "work":
		//проверяю, что текущий спрайт не спрайт работы терминала
		if (str != "spr_terminal_work") { 
			if (sprite_exists(asset_get_index("spr_terminal_work_" + str1))) {
				//назначаю спрайт работающего объекта, добавляя имя самого объекта
				sprite_index = asset_get_index("spr_terminal_work_" + str1);
			}
		}
	break;
}

if (hp > 0) {
	//если терминал перезагружается (т.е. идут 5 минут с последнего сохранения игрока(
	if (terminal_state == "reload") {
		draw_text(x, y - sprite_get_height(sprite_index) / 2 - 5, "Подождите, идет загрузка системы");
	} else {
		if (terminal_saves > 10) {
			draw_text(x, y - sprite_get_height(sprite_index) / 2 - 5, "Памяти хватит\nещё надолго!");
		} else {
			if (terminal_saves > 0) {
				draw_text(x, y - sprite_get_height(sprite_index) / 2 - 5, 
					"Памяти хватит на\n" + string(terminal_saves) + " " + 
					scr_str_defEnding("сохранени", terminal_saves));
			}
		}
	}
}

draw_self();