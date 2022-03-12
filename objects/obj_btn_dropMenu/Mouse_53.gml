/// @description удаление и создание подменю

//при диалоге остальные кнопки не активны
if (!obj_ctrl_dlg.ctrl_dlg_exist) {
	//если кликнули на ,,родителя,, все субэлементы можно удалить:
	//если они наши, то список просто свернут, если чужие - клик за пределами меню
	if (position_meeting(mouse_x, mouse_y, self)) {
		if (instance_exists(obj_btn_dropMenuEl)) {
			with (obj_btn_dropMenuEl) {
				instance_destroy();	
			}
		}
		//если на ,,родителя,, кликнули и у него не был развернут список, создаем его
		if (btn_pressed) {
			var inc = sprite_get_height(spr_btn_other_dropMenuEl1);
			var y_new = inc + y - 2;	//отступ
			for (var i = 0; i < ds_list_size(btn_list_dropElTxt); i++) {
				var item = instance_create_depth(x, y_new, depth, obj_btn_dropMenuEl);
				item.sprite_index = spr_btn_other_dropMenuEl1;
				item.draw_txt = ds_list_find_value(btn_list_dropElTxt, i);
				item.type = "func";
				item.action = action;
				item.sound = sound;
				item.iid = id;		//чтобы субэлемент ,,знал,, кто ,,родитель,,
				ds_list_add(btn_list_dropEl, item);	//сохраняем субэлементы
				y_new += inc - 2
			}
		}
	} else {
		//если кликнули вне меню, а список был открыт нами, удаляем его 
		//(удаляем только те эл-ты, которые создал конкретно этот экземпляр)
		if (!position_meeting(mouse_x, mouse_y, obj_btn_dropMenuEl)) {
			if (instance_exists(obj_btn_dropMenuEl)) {
				for (var i = 0; i < ds_list_size(btn_list_dropEl); i++) {
					instance_destroy(btn_list_dropEl[|i]);
				}
				//очистка массива субэлементов 
				ds_list_clear(btn_list_dropEl);
			}
		}
	}
}