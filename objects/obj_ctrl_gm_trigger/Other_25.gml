/// @description выполнение действий

//первая часть
switch (action) {
	case "dlg1_1": //второй диалог (обучалка: как передвигаться)
		//вызываю первый диалог 
		obj_ctrl_gm.action = "dlg2_1";
		obj_ctrl_gm.ctrl_gm_historyInd = "2_1";	//индекс диалога для контроллера комнаты истории
		//ds_list_add(obj_ctrl_tml.ctrl_tml_list_, ["dlg1_1", 1.5]);
		instance_destroy();
	break;
	case "dlg1_2": //второй диалог (обучалка: как взаимодействовать с предметами)
		obj_ctrl_gm.action = "dlg1_2";
		obj_ctrl_gm.ctrl_gm_historyInd = "1_2";	//индекс диалога для контроллера комнаты истории
		instance_destroy();
	break;
	case "dlg1_3": //разговор со Степаном, передача дела
		obj_ctrl_gm.action = "dlg1_3";
		obj_ctrl_gm.ctrl_gm_historyInd = "1_3";	//индекс диалога для контроллера комнаты истории
		instance_destroy();
	break; 
	/*
	case "":
		
	break;
	*/
	//подсказка с уровня офиса о степашке (что он забыл у босса)
	case "hint_office1":
		obj_ctrl_gm_hint.ctrl_hint_newHint = "hint_office1";
		instance_destroy();
	break;
	////подсказка с этажа босса
	//case "hint_boss1":
	//	obj_ctrl_gm_hint.ctrl_hint_newHint = "hint_boss1";
	//	instance_destroy();	
	//break;
	//подсказка с уровня ,,холл,, о том, что выйти из здания еще нельзя
	case "hint_hole1":
		obj_ctrl_gm_hint.ctrl_hint_newHint = "hint_hole1";
	break;
	//подсказка с уровня офиса ,,допросная,, 
	case "hint_torture1":
		obj_ctrl_gm_hint.ctrl_hint_newHint = "hint_torture1";
	break;
	case "selfDestroy":
		instance_destroy();	
	break;
}