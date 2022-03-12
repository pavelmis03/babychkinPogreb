sprite_index = spr_btn_mm_editor1;

var t = scr_btn_posInScr(5, 6);
x = t[0];
y = room_height * 0.483;
image_xscale = 0.95;
image_yscale = 0.95;

//type = "transition";
type = "confirmYCl";
//action = "goToEditor";
action = ["noEditor", "cansel"];
sound = [20, "snd_menu_snd_enterDoor", "snd_menu_snd_openDoor"];
