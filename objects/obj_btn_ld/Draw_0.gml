/// @description 

draw_self();

//отрисовка заголовка
draw_set_color(draw_txt_cl);
draw_set_font(fnt_russian);
//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
draw_text(draw_txt_x, draw_txt_y, draw_txt);

//подпись (что это такое)
draw_set_font(fnt_set);
draw_set_color(draw_txt_cl2);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(draw_txt_x2, draw_txt_y2, draw_txt2);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

