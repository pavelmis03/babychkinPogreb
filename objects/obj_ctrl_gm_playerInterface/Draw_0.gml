/// @description интерфейс игрока
//!!!!!!!!!!ПРИВЯЗКА ИДЕТ В ПРОЦЕНТАХ ОТ ВИДА!!!!!!!!!!!!!

//переменные вида для привязки к нему интефейса
var view_x = camera_get_view_x(view_camera[0]);
var view_y = camera_get_view_y(view_camera[0]);
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);
//объект игрока
var player = scr_player_type();

//если игрока не существует, рисовать нечего
if (player != -1) {
	//ИНТЕРФЕЙС ИГРОКА
	draw_set_font(fnt_gm_cmn);
	draw_set_color(c_white);

	//if (obj_ctrl_gm.ctrl_gm_stage != 1) {  //D
	if (obj_ctrl_gm.ctrl_gm_stage == 1) {	 //!D
		//текстовые жизни (цвет зависит от остатка)
		draw_set_color(c_lime);						
		if (player.hp < 900) {draw_set_color(c_blue)}
		if (player.hp < 800) {draw_set_color(c_green)}
		if (player.hp < 700) {draw_set_color(c_yellow)}
		if (player.hp < 500) {draw_set_color(c_orange)}
		if (player.hp < 250) {draw_set_color(c_red)}
	
		//числовые параметры
		draw_text(view_x + view_w * 0.17, view_y + view_h * 0.139, "Твои HP: " + string(round(player.hp)));
		draw_text(view_x + view_w * 0.17, view_y + view_h * 0.157, "Деревянные (₽): " + string(round(100 /*заглушка (должны быть рубли)*/)));
		draw_text(view_x + view_w * 0.17, view_y + view_h * 0.176, "Капуста ($): 000 (всегда на нуле)");
	
		//силы для быстрого бега
		draw_set_color(c_white);
		draw_text(view_x + view_w * 0.17, view_y + view_h * 0.074, "Дыхалка: ");
		draw_rectangle(view_x + view_w * 0.17, view_y + view_h * 0.111, view_x + view_w * 0.227, view_y + view_h * 0.126, true);
		draw_set_color(c_orange);
		draw_rectangle(view_x + view_w * 0.1715, view_y + view_h * 0.114, view_x + view_w * 0.172 + 50/*заглушка (должны быть силы для бега)*/, view_y + view_h * 0.123, false);
	
		/*	
		//ИНФОРМАЦИЯ О СНАРЯЖЕНИИ И БОЕПРИПАСАХ
		
		//АВТОМАТ
		draw_set_color(c_blue);
		if (global.nomber_gun_using = 0) {
			draw_set_color(c_yellow);
		}
		draw_text(view_x + 45, view_y + 40, "Патроны: ");
		if ((global.loadflag1 >= 18) or (global.patronsauto <= 40)) {
			draw_set_color(c_orange);
		} //если в обойме или впринципе осталось мало патронов назначаю оранжевый цвет
	
		//РИСУЮ ИКОНКИ К ОРУЖИЮ
		draw_sprite(spr_icon_automat, image_index, view_x + 175, view_y + 40);		//атомат
		*/	
	}
}