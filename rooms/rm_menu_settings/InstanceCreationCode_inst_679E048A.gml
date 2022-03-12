sprite_index = spr_btn_other_dropMenu1;

//var t = scr_btn_posInScr(id, 1, -1);
x = room_width * 0.7;
y = room_height * 0.1;

type = "func";
action = "difficultyLvl";
sound = [20, "snd_none", "snd_none"];

//подгрузка настроек
draw_txt = obj_ctrl_set.ctrl_set_map_curr[?"difficultyLvl"];
ds_list_add(btn_list_dropElTxt, "Твой брат на таком играет", "Нормальный",
								"Для настоящих пацанов", "Для отбитых безумцев");

draw_txt_x = x;
draw_txt_y = y;

//drawing (текст рядом - подпись)
draw_txt2 = "Уровень\nсложности";
draw_txt_cl2 = c_black;
draw_txt_x2 = x - 10;
draw_txt_y2 = y;