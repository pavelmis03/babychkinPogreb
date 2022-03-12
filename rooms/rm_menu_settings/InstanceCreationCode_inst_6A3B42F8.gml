sprite_index = spr_btn_other_slider1;

//var t = scr_btn_posInScr(id, 1, -1);
x = room_width * 0.18;
y = room_height * 0.25;

//type = "flag";
action = "sound_val";
sound = [20, "snd_none", "snd_none"];

//рассчитываем до того, как ползунок переместится на значение из настроек
btn_slider_right_x = x + 100;	//правая граница, до которой можно дотянуть ползунок
btn_slider_left_x = x;			//левая граница, до которой можно дотянуть ползунок

//подгрузка настроек из файла
x += real(obj_ctrl_set.ctrl_set_map_curr[?"sound_val"]) - sprite_get_width(spr_btn_other_slider1) / 2;
val = real(obj_ctrl_set.ctrl_set_map_curr[?"sound_val"]);

//drawing
draw_txt = "Громкость звуков";
draw_txt_cl = c_black;
draw_txt_x = btn_slider_left_x - 10;
draw_txt_y = y;

