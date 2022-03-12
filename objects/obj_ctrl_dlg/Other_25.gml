/// @description только для создания диалога

var t_x = (room_width - sprite_get_width(spr_dlg_bg)) / 2;
var t_y = (room_height - sprite_get_height(spr_dlg_bg)) / 2;

//настройки для отрисовки фона и текста
sprite_index = spr_dlg_bg;
x = t_x;
y = t_y;
depth = ctrl_dlg_map_depth[?room];
draw_txt = ctrl_dlg_map_txt[?action[0]];
draw_txt_x = t_x + 30;
draw_txt_y = t_y + 150;

//создаю кнопку да
t_x -= 70;
t_y += sprite_get_height(spr_dlg_bg) - 25;
ctrl_dlg_arr_btn[0] = scr_btn_create(t_x, t_y, spr_dlg_yes1, depth - 1, 0, action[0], "dlg_btn", [20, "snd_none", "snd_none"]);

//создаю кнопку нет, если в типе требуемого диалога фигурирует эта кнопка
if (string_pos("N", type) != 0) {
	t_x += sprite_get_bbox_right(spr_dlg_yes1) - sprite_get_bbox_left(spr_dlg_yes1) + 70;
	ctrl_dlg_arr_btn[2] = scr_btn_create(t_x, t_y, spr_dlg_no1, depth - 1, 0, action[2], "dlg_btn", [20, "snd_none", "snd_none"]);
}

//создаю кнопку отмена
var t_x = (room_width + sprite_get_width(spr_dlg_bg)) / 2 - 45;
var t_y = (room_height - sprite_get_height(spr_dlg_bg)) / 2 + 5;
ctrl_dlg_arr_btn[1] = scr_btn_create(t_x, t_y, spr_dlg_cansel1, depth - 1, 0, action[1], "dlg_btn", [20, "snd_none", "snd_none"]);