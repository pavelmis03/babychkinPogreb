sprite_index = spr_btn_menu_back1;

//var t = scr_btn_posInScr(id, 5, 5);
x = room_width * 0.8;
y = view_hport[0] * 0.8;

type = "transition";
action = "back";
sound = [20, "snd_none", "snd_none"];

//передаем id контроллеру статистики, чтобы он мог привязать кнопку к виду
array_push(obj_ctrl_stat.ctrl_stat_arr_btn, id);
