/// @description нейтраль
//если нажато сцепление (оно не может быть нажато, если игрок не в машине и она не заведена)
//if ((buh_coupling) and (buh_transmission != 0)) {
//т.к. на нейтраль нужно разрешить ставить даже если заглохли, то здесь отдельная проверка
if ((buh_playerIn) and (keyboard_check(vk_shift)) and (buh_transmission != 0)) {
	buh_transmission = 0;	//включаем нейтраль
	scr_snd_requestPlaySnd(snd_buh_transmissionChange, snd_buh_transmissionChange, 20, true);	//звук 
	array_push(obj_ctrl_snd.sound, 20, "snd_buh_transmissionChange");
}