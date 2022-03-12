sprite_index = spr_btn_other_dropMenu1;

//var t = scr_btn_posInScr(id, 1, -1);
x = room_width * 0.7;
y = room_height * 0.5;

type = "func";
action = "screenResolution";
sound = [20, "snd_none", "snd_none"];


//подгрузка настроек
draw_txt = obj_ctrl_set.ctrl_set_map_curr[?"screenResolution"];
ds_list_add(btn_list_dropElTxt,	"1920x1080", "1366x768", "1280x1024", "1024x768");

draw_txt_x = x;
draw_txt_y = y;

//drawing (текст рядом - подпись)
draw_txt2 = "Разрешение экрана";
draw_txt_cl2 = c_black;
draw_txt_x2 = x - 10;
draw_txt_y2 = y;

