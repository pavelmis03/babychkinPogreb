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
if (visible == 1) {
	//жизни
	draw_set_color(c_white);
	draw_rectangle(player.x - 56, player.y - 32, player.x + 56, player.y - 49, true);
	draw_rectangle_color(player.x - 54, player.y - 34, player.x + 54, player.y - 47, c_red, c_lime, c_lime, c_red, false);
	draw_set_color(c_black);
	draw_rectangle(player.x - 54 + (obj_ctrl_gm_playerStatus.hp) / 10, player.y - 34, player.x + 54 , player.y - 47, false);
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