/// @description отображение информации о кнопке

draw_sprite(sprite_index, image_index, x, y);

draw_set_font(fnt_cmn_small);
draw_set_color(c_white)

//рисую скрин на кнопке сохранения (уменьшаю скриншот сохранения (изначально 1920х1080))
draw_sprite_ext(draw_img, image_index, x + 5, y + 5, 160 / room_width, 90 / room_height, 0, -1, 1);

//информация по сохранению
var tx = x + 35 + sprite_get_width(draw_img) * (160 / room_width);
draw_text(tx, y + 10, btn_infoStruct[$"dateTime"])
draw_text(tx, y + 30, btn_infoStruct[$"dateTimeGm"])
draw_text(tx, y + 45, btn_infoStruct[$"quest"])
draw_text(tx, y + 60, btn_infoStruct[$"location"])
draw_line(tx, y + 75, tx + 150, y + 75);
draw_text(tx, y + 80, btn_infoStruct[$"parent"])