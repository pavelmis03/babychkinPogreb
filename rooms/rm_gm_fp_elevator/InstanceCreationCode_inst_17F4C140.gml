//13 этажей: -3 - -1, 1 - 10, но названия спрайтов с единицы, поэтому 10 этаж + 3 = 13
sprite_index = spr_btn_elevator_131;

x = room_width * 0.6;
y = room_height * 0.2;
image_xscale = 1;
image_yscale = 1;

type = "transition";
action = "goToHole";	//этаж
sound = [20, "snd_menu_snd_enterDoor", "snd_menu_snd_openDoor"];

txt = "10";	//цифра на кнопке


