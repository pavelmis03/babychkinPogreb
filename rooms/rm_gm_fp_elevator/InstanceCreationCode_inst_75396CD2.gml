//13 этажей: -3 - -1, 1 - 10, но названия спрайтов с единицы, поэтому 10 этаж + 3 = 13
sprite_index = spr_btn_elevator_131;

//x = room_width * 0.56;
//y = room_height * 0.13;
image_xscale = 1;
image_yscale = 1;

type = "transition";
action = "goToOffice";	//этаж
sound = [20, "snd_none", "snd_gm_lift_pressBtn"];

//задержка срабатывания transition, чтобы создать эффект движения в лифте и успеть прошлушать звук
btn_transitionDelay = 0; //секунды


//этаж Леонида (10)


