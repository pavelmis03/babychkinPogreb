/// @description 

// Inherit the parent event
event_inherited();

//если наша кнопка выбрана, то назначаем ей фокус, пока она в фокусе, она нажата
if (obj_ctrl_rmLdGm.btn_loaderId[obj_ctrl_rmLdGm.btn_loaderNum] == id) {
	//если кнопке назначили фокус, нажимаем ее
	if (sprite_index != spr_btn_ldGm_loader2) {
		//запускаем спрайт нажатия кнопки		
		sprite_index = spr_btn_ldGm_loader2;
		image_index = 0;
	}
	//включаем скорость проигрывания 
	image_speed = 1;
	btn_focus = true;
} else {
	//если мы снимаем фокус, то надо выключить нажатие
	if (btn_focus) {
		//если кнопка нажалась и проиграла спрайт, возвращаем последнюю картинку спрайта наведения
		sprite_index = spr_btn_ldGm_loader1;
		image_index = 0;
		image_speed = 0;
		btn_pressed = false; 
	} 
	btn_focus = false;
}