//13 этажей: -3 - -1, 1 - 10, но названия спрайтов с единицы, поэтому 10 этаж + 3 = 13
sprite_index = spr_btn_elevator_71;

//x = room_width * 0.4;
//y = room_height * 0.28;
image_xscale = 1;
image_yscale = 1;

type = "transition";
action = "goToFloor2";	//этаж
sound = [20, "snd_menu_snd_enterDoor", "snd_menu_snd_openDoor"];

