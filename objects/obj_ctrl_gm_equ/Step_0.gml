/// @description 

if (!init) {
	event_user(0);
}

// проверка на добавление предмета
if (room == rm_menu_inv) {// если мы в комнате инвентаря
	if (obj_ctrl_gm_rmInv.inv_type == "normalInv") {	// и тип инвентаря - обычный (снаряжения)
		// проверяем снаряжение на наличие новых предметов и обновляем по ним доп. информацию
		scr_equ_updateEquInfo(); 
	}
} 


// выполнение действия
if (action != "") {
	event_user(15);
}