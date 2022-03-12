sprite_index = spr_btn_other_check;

//var t = scr_btn_posInScr(id, 1, -1);
x = room_width * 0.30;
y = room_height * 0.4;

type = "flag";
action = "music";
sound = [20, "snd_none", "snd_none"];

//подгрузка настроек из файла
btn_pressed = bool(obj_ctrl_set.ctrl_set_map_curr[?"music"]);
//в спрайте всего две картинки: активно/не активно
image_index = btn_pressed;

//drawing
draw_txt = "Музыка";
draw_txt_cl = c_black;
draw_txt_x = x - 10;
draw_txt_y = y;




