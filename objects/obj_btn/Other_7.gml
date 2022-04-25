/// @description 
/*
var x1 = x + sprite_get_bbox_left(sprite_index);
var x2 = x + sprite_get_bbox_right(sprite_index);
var y1 = y + sprite_get_bbox_top(sprite_index);
var y2 = y + sprite_get_bbox_bottom(sprite_index);
*/
//каждый спрайт проигрывается один раз, поэтому по завершении мы его останавливаем 
//потому что animation end ждет, пока спрайт проиграется до конца (т.е. пока счетчик не дойдет до нуля (круг))
image_index = image_number - 0.1 * image_speed;
image_speed = 0;
//если кнопка была нажата, совершаем действие
if (btn_pressed) {
	event_user(15);	
	//если кнопка нажалась и проиграла спрайт, возвращаем последнюю картинку спрайта наведения
	var str = sprite_get_name(sprite_index);
	var str1 = string_copy(str, 0, string_length(str) - 1); 
	sprite_index = asset_get_index(str1 + "1");
	btn_pressed = false; 
}
