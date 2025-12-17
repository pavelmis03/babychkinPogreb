sprite_index = spr_btn_inv_next1;

// var t = scr_btn_posInScr(id, 5, 5);
// x = room_width * 0.8;
// y = view_hport[0] * 0.8;

type = "func";
action = "invNextPageBox";
sound = [20, "snd_gm_btnEnter", "snd_gm_btnClick"];


// отправляем свои id контроллеру комнаты инвентаря 
obj_ctrl_gm_rmInv.inv_btn[1] = id;

depth = 1;	// костыль, чтобы текст подсказки рисовался над кнопкой