/// @description 

var x1 = bbox_left;
var x2 = bbox_right;
var y1 = bbox_top;
var y2 = bbox_bottom;
var ctrl = obj_ctrl_gm_rmInv;

if (!init) {
	event_user(0);
}

// если курсор слева и ячейка относится к инвентарю или курсор справа и ячейка относится к контрагенту
if (((mouse_x < room_width * inv_sideCoef) and (cell_owner == "ctrl")) or 
	((mouse_x >= room_width * inv_sideCoef) and (cell_owner != "ctrl"))) {
	cell_active = true;	// то она может быть использована
} else {
	cell_active = false;
}

// если был сигнал на деактивацию кнопок 
if (obj_ctrl_dlg.ctrl_dlg_disable_btn == 1) {
	btn_enable = false;
}
// сигнал на активацию кнопки
if (obj_ctrl_dlg.ctrl_dlg_disable_btn == 2) {
	btn_enable = true;
	cl_subl = c_white;	// убираем серый налет после деактивации
}
// настройка спрайта недоступности
if (!btn_enable) {
	cl_subl = c_dkgrey;
}

// деактивируются, например, при диалогах
if (btn_enable) {
	if ((point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) or // или если мы в фокусе и курсор на нашей стороне
		((ctrl.row == cell_numR) and (ctrl.col == cell_numC) and (cell_active))) {
		if ((!btn_enter) and (!btn_pressed)) {
			cl_subl = c_white;
			// воспроизводим звук наведения
			scr_snd_requestPlaySnd(sound[0], sound[1], sound[1], true);	// звук 
			// obj_ctrl_snd.action = "playSnd";
			// array_push(obj_ctrl_snd.sound, sound[0], sound[1]);
			btn_enter = true;
			// назначаем ячейку в фокусе
			// ctrl.row = cell_numR;
			// ctrl.col = cell_numC;
		}
		// назначаем ячейку в фокусе
		ctrl.row = cell_numR;
		ctrl.col = cell_numC;
	} else {
		if (btn_enter) {
			// if (!btn_pressed) {
				btn_enter = false;
				btn_pressed = false
				cl_subl = c_white;
			// }
			// btn_pressed = false; 
		}
	}
	// если на ячейку был наведен курсор, сообщаем об этом контроллеру
	if (point_in_rectangle(mouse_x, mouse_y, x1, y1, x2, y2)) {	
		// если нет диалога и мышь не наведена на ячейку
		ctrl.mouseOnCellId = id;
	} else {	// если с нашей ячейки убрали мышь и в контроллере сохранен наш id, стираем запись об этом
		if (ctrl.mouseOnCellId == id) {
			ctrl.mouseOnCellId = -1;
		}
	}
}

if (action != "") {
	event_user(15);
	action = "";
}