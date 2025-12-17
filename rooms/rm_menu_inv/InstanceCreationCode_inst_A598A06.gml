sprite_index = spr_btn_inv_use1;

// var t = scr_btn_posInScr(id, 5, 5);
// x = room_width * 0.8;
// y = view_hport[0] * 0.8;

type = "func";
action = "invUseItem";
sound = [20, "snd_gm_btnEnter", "snd_gm_btnClick"];

depth = 1;	// костыль, чтобы текст подсказки рисовался над кнопкой

// отправляем свои id контроллеру комнаты инвентаря 
obj_ctrl_gm_rmInv.inv_btn[2] = id;
