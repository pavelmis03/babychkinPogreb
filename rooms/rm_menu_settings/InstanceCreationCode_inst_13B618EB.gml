sprite_index = spr_btn_other_switch;

//var t = scr_btn_posInScr(id, 1, -1);
x = room_width * 0.6;
y = room_height * 0.4;

type = "flag";
action = "buhankaMvJL";
sound = [20, "snd_none", "snd_none"];


//подгрузка настроек
btn_pressed = bool(obj_ctrl_set.ctrl_set_map_curr[?"buhankaMvJL"]);
//в спрайте всего две картинки: активно/не активно
image_index = btn_pressed;

//drawing
draw_txt = "Управление буханкой\n (←→/JL)";
draw_txt_cl = c_black;
draw_txt_x = x - 10;
draw_txt_y = y;

