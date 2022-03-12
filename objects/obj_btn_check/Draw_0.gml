/// @description 

draw_self();
//подпись (что за галочка)
draw_set_font(fnt_set);
draw_set_color(draw_txt_cl);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text(draw_txt_x, draw_txt_y, draw_txt);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

