/// @description 

image_speed = 0;

// если закончились предметы внутри или жизни, удаляем, если надо
if ((inv_hp == 0) or (inv_weight == 0)) {
	if (inv_isRmv) {
		instance_destroy();
	}
}
scr_env_stopInteract();	// прекращаем взаимодействие

