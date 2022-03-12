/// @function scr_btn_posInScr(ind, num);
/// @param {} ind	номер кнопки в последовательности с единицы
/// @param {} num	количество кнопок в последовательности
/// @description	скрипт определяет координаты кнопки в комнате
function scr_btn_posInScr(ind, num){
	var free_space = room_width - num * sprite_width;
	var margin = free_space / (num + 1);
	var t_x = margin * ind + sprite_width * (ind - 1);
	var t_y = (room_height - sprite_height) / 2;
	return [t_x, t_y];
}