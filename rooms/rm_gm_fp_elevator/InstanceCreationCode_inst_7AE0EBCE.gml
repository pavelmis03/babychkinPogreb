sprite_index = spr_btn_elevator_1;

var t = scr_btn_posInScr(1, 1);
x = t[0];
y = room_height * 0.278;
image_xscale = 0.95;
image_yscale = 0.95;

type = "transition";
action = "goTo";	//этаж
sound = [20, "snd_menu_snd_enterDoor", "snd_menu_snd_openDoor"];

txt = "10";	//цифра на кнопке


