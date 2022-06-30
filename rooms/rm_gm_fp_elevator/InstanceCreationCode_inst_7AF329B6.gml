//13 этажей: -3 - -1, 1 - 10, но названия спрайтов с единицы, поэтому 10 этаж + 3 = 13
sprite_index = spr_btn_elevator_51;

//x = room_width * 0.4;
//y = room_height * 0.58;
image_xscale = 1;
image_yscale = 1;

type = "transition";
action = "goToFloor4";	//этаж
sound = [20, "snd_menu_enterDoor", "snd_menu_openDoor"];

