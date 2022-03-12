sprite_index = spr_btn_mm_newGm1;

var t = scr_btn_posInScr(2, 6);
x = t[0];
y = room_height * 0.483;
image_xscale = 0.95;
image_yscale = 0.95;

type = "transition";
action = "goToNewGm";
sound = [20, "snd_menu_snd_enterDoor", "snd_menu_snd_openDoor"];