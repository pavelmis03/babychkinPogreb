/// @description бибикалка

if (buh_playerIn) {	//если игрок внутри
	//воспроизводим звук
	obj_ctrl_snd.action = "playSnd";
	array_push(obj_ctrl_snd.sound, 20, "snd_buh_beep");
}


