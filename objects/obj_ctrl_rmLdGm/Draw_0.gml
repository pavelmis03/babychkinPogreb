/// @description 


//спрайт скриншота сохранения
image_xscale = 300 / 1920;	//скрины размером 1920х1080, уменьшаю их
image_yscale = 169 / 1080;
draw_sprite(draw_spr, 0, draw_txt_x, draw_txt_y);

//отображение номера игры
draw_set_color(c_black);
draw_text(room_width * 0.24, room_height * 0.22, "ИГРА " + string(ctrl_ldGm_gm_curr) + "/" + string(ctrl_ldGm_gm));

//отображение страницы сохранений
draw_set_color(c_black);
draw_text(room_width * 0.45, room_height * 0.8, "Страница " + string(ctrl_ldGm_page_curr) + "/" + string(ceil(ctrl_ldGm_page)));

//отрисовка скриншота сохранения 


//отрисовка информации о сохранении


