sprite_index = spr_btn_mm_exit1;

var t = scr_btn_posInScr(6, 6);
x = t[0];
y = room_height * 0.488;
image_xscale = 0.95;
image_yscale = 0.95;

type = "confirmYNCl";
action = ["exitGm", "cansel", "cansel"];
sound = [20, "snd_menu_MMEnterDoor", "snd_menu_MMOpenDoor"];