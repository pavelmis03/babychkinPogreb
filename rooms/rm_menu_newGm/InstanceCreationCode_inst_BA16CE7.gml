sprite_index = spr_btn_newGm_newGm1;

var t = scr_btn_posInScr(1, 2);
x = t[0];
y = room_height * 0.483;
//image_xscale = 0.95;
//image_yscale = 0.95;

//type = "transition";
type = "confirmYNCl_new";
action = ["tryNewGm", "cansel", "cansel"];
sound = [20, "snd_menu_MMEnterDoor", "snd_menu_MMOpenDoor"];
