/// @description выполнение действий

switch (action) {
	case "dlg1_2": //второй диалог (обучалка: как взаимодействовать с предметами)
		obj_ctrl_gm.action = "dlg1_2";
		instance_destroy();
	break;
}
