/// @description 

//если игрок зашел в меню статистики
if (ctrl_stat_menu) {
	//если текст увеличился, увеличиваем комнату 
	if (ctrl_stat_enlarging == 2) {
		//если стрелочки еще не были созданы
		if (array_length(ctrl_stat_arr_btn) < 3) {
			var obj = instance_create_depth(room_width * 0.05, room_height * 0.8, 0, obj_btn);
			obj.sprite_index = spr_btn_stat_up1;
			obj.type = "func";
			obj.action = "arrowUp";
			obj.sound = [20, "snd_none", "snd_none"];
			array_push(ctrl_stat_arr_btn, obj);
			
			obj = instance_create_depth(room_width * 0.05, room_height * 0.9, 0, obj_btn);
			obj.sprite_index = spr_btn_stat_down1;
			obj.type = "func";
			obj.action = "arrowDown";
			obj.sound = [20, "snd_none", "snd_none"];
			array_push(ctrl_stat_arr_btn, obj);
		}
		//двигаем камеру вниз при увеличении комнаты
		var t_y = camera_get_view_y(view_camera[0]);
		camera_set_view_pos(view_camera[0], 0, t_y + room_height * 0.1);
		//увеличиваем комнату
		room_height += room_height * 0.1;
		ctrl_stat_enlarging = 0;
	}
	//если текст уменшился, уменьшаем комнату 
	if (ctrl_stat_enlarging == 1) {
		//уменьшать можно до тех пор, пока комната больше окна
		if (room_height > view_hport[0]) {
			//уменьшаем комнату
			room_height -= room_height * 0.1;
			//при уменьшении комнаты сдвигаем вид
			var t_y = camera_get_view_y(view_camera[0]);
			if (t_y - room_height * 0.1 > 20) {
				camera_set_view_pos(view_camera[0], 0, t_y - room_height * 0.1);
			} else {
				camera_set_view_pos(view_camera[0], 0, 20);
			}
		}
		if (room_height <= view_hport[0]) {
			//удаляю стрелочки, если они есть
			if (array_length(ctrl_stat_arr_btn) == 3) {
				instance_destroy(array_last(ctrl_stat_arr_btn));
				array_pop(ctrl_stat_arr_btn);
				instance_destroy(array_last(ctrl_stat_arr_btn));
				array_pop(ctrl_stat_arr_btn);
			}
		}
		ctrl_stat_enlarging = 0;
	}
	//привязка стрелочек и кнопки назад к виду
	for (var i = 0; i < array_length(ctrl_stat_arr_btn); i++) {
		var t_id = ctrl_stat_arr_btn[i];
		t_id.y = camera_get_view_y(view_camera[0]) + view_hport[0] * 0.9;
		//для стрелочки вверх
		if (t_id.action == "arrowUp") {
			t_id.y = camera_get_view_y(view_camera[0]) + view_hport[0] * 0.8;
		}
	}
}


//выполнение действия
if (action != "") {
	event_user(15);
	action = "";
}