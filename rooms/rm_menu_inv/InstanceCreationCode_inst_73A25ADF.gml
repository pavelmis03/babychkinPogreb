// взять все
sprite_index = spr_btn_inv_takeAll1;

// var t = scr_btn_posInScr(id, 5, 5);
// x = room_width * 0.8;
// y = view_hport[0] * 0.8;

type = "confirmYNCl_invBox";
action = ["invTakeAll", "cansel", "cansel"];
sound = [20, "snd_none", "snd_none"];

depth = 1;	// костыль, чтобы текст подсказки рисовался над кнопкой

// отправляем свои id контроллеру комнаты инвентаря 
obj_ctrl_gm_rmInv.inv_btn[4] = id;
