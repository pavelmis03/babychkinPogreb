sprite_index = spr_btn_mm_info1;

var t = scr_btn_posInScr(3, 6);
x = t[0];
y = room_height * 0.48;
image_xscale = 0.95;
image_yscale = 0.95;

type = "transition";
action = "goToInfo";
sound = [20, "snd_menu_enterDoor", "snd_menu_openDoor"];