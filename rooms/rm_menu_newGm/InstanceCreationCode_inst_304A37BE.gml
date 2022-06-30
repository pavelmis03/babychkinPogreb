sprite_index = spr_btn_newGm_endless1;

var t = scr_btn_posInScr(2, 2);
x = t[0];
y = room_height * 0.483;
//image_xscale = 0.95;
//image_yscale = 0.95;

//type = "transition";
type = "confirmYCl";
action = ["noEndless", "cansel", "cansel"];
sound = [20, "snd_menu_enterDoor", "snd_menu_openDoor"];
