/// @description 

if (!init) {
	event_user(0);	
}

// при переходе в другую комнату, музыка из прошлой останавливается, если там такая же, 
// музыка продолжает играть, если другая, удаляется и играет новая
// проверка на переход в другую комнату
if (obj_ctrl_mv.ctrl_mv_change_rm) {
	array_push(action, "changeRm");
}

// удаление отыгранных звуков
for (var i = 0; i < array_length(ctrl_snd_arr_on); i++) {
	if (!audio_is_paused(ctrl_snd_arr_on[i][0])) {	// если звук не остановлен
		if (!audio_is_playing(ctrl_snd_arr_on[i][0])) {	// и не играется
			array_delete(ctrl_snd_arr_on, i, 1);	// удаляем идентификатор 
			i--;
		}
	}
}


// выполнение действия
if (array_length(action) != 0) {
	event_user(15);
	action = [];
}