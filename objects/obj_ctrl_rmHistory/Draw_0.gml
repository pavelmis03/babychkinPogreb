/// @description 

//рисование слайда истории или диалога
var t = 0.5;
if (obj_ctrl_gm.ctrl_gm_histStatus == 2) {
	t = 0;
}
//спрайт диалога один, меняется лишь кадр
draw_sprite(draw_spr, ctrl_history_page_curr, room_width * t, room_height * t);

//справка
draw_set_color(c_white);
draw_set_font(fnt_set);
var t1 = "Нажимайте “←/→”, “пробел”, чтобы листать";
var t2 = "Нажмите “enter”, чтобы закончить";
draw_text(room_width * 0.95 - string_width(t1), room_height * 0.9, t1);
draw_text(room_width * 0.95 - string_width(t2), room_height * 0.95, t2);


