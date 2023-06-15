/// @description отображение информации о кнопке

draw_sprite(sprite_index, image_index, x, y);
draw_set_font(fnt_cmn_small);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_color(c_black);

//рисую скрин на кнопке сохранения (уменьшаю скриншот сохранения (изначально 1920х1080))
draw_sprite_ext(draw_img, image_index, x + 8, y + 5, 150 / room_width, 76 / room_height, 0, -1, 1);

//информация по сохранению
var tx = x + 20 + sprite_get_width(draw_img) * (160 / room_width);
//проверяю, что текст не вылезает
var newStr1 = scr_str_cpSStrByLen(btn_infoStruct[$"name"], 280 * image_xscale);
var newStr2 = scr_str_cpSStrByLen("Родитель: " + btn_infoStruct[$"parent"], 280 * image_xscale);
if (string_width(btn_infoStruct[$"name"]) > 280 * image_xscale) {
	newStr1 += "...";	//если вылезает, добавляю многоточие
}
if (string_width("Родитель: " + btn_infoStruct[$"parent"]) > 280 * image_xscale) {
	newStr2 += "...";	//если вылезает, добавляю многоточие
}
draw_text(tx, y + 10, newStr1);	//имя сохранения
draw_text(tx, y + 52, newStr2);	//родительское сохранение
draw_set_font(fnt_cmn_smallB);
draw_text(tx, y + 25, btn_infoStruct[$"dateTime"]);
//draw_text(tx, y + 18, btn_infoStruct[$"dateTimeGm"]);
//draw_text(tx, y + 28, btn_infoStruct[$"quest"]);
//draw_text(tx, y + 38, btn_infoStruct[$"location"]);
draw_line_width(tx, y + 48, tx + 150, y + 48, 2);
