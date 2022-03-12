/// @description 

//заполнениие 
t_xscale = (x - btn_slider_left_x + 32) / sprite_width;
t_x = btn_slider_left_x - sprite_width / 2 - 5;
draw_sprite_ext(spr_btn_other_slider3, image_index, t_x , y, t_xscale, image_yscale, image_angle, image_blend, image_alpha);
//граница полоски заполнения
var t_xscale = (btn_slider_right_x - btn_slider_left_x + 32) / sprite_width;
var t_x = btn_slider_left_x - sprite_width / 2 - 5;
draw_sprite_ext(spr_btn_other_slider2, image_index, t_x , y, t_xscale, image_yscale, image_angle, image_blend, image_alpha);
//отрисовка себя
draw_sprite(sprite_index, image_index, x, y);

//подпись (что за ползунок)
draw_set_font(fnt_set);
draw_set_color(draw_txt_cl);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(draw_txt_x, draw_txt_y, draw_txt);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

