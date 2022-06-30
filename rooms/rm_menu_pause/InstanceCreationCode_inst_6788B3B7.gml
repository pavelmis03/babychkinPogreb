//выйти в главное меню
sprite_index = spr_btn_pause_exitToMM1;

var t = scr_btn_posInScr(4, 4);
x = t[0];
y = room_height * 0.478;
image_xscale = 0.95;
image_yscale = 0.95;

type = "confirmYCl";
action = ["goToMM_pause", "cansel"];
sound = [20, "snd_menu_enterDoor", "snd_menu_openDoor"];