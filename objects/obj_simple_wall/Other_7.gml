/// @description 

//если мы не собираемся самоуничтожаться и то после проигрывания спрайта смерти замираем на последнем кадре
if (sprite_index == mapObj_sprdeath) {
	image_speed = 0;
	image_index = image_number - 0.1;
}