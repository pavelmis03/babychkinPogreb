/// @description кнопки из меню лифта первой части

event_inherited();

//словарь соответствия действие - этаж. нужен для блокировки попыток приехать на текущий этаж
btn_lift_floor = ds_map_create();
btn_lift_floor[?"goToFloor1"] = rm_gm_fp_floor1;
btn_lift_floor[?"goToFloor2"] = rm_gm_fp_floor2;
btn_lift_floor[?"goToFloor3"] = rm_gm_fp_floor3;
btn_lift_floor[?"goToFloor4"] = rm_gm_fp_floor4;
btn_lift_floor[?"goToOffice"] = rm_gm_fp_office;
btn_lift_floor[?"goToBoss"] = rm_gm_fp_bossFloor;
btn_lift_floor[?"goToHole"] = rm_gm_fp_hole;
btn_lift_floor[?"goToParking"] = rm_gm_fp_parking;
btn_lift_floor[?"goToTorture"] = rm_gm_fp_torture;
btn_lift_floor[?"goToArmory"] = rm_gm_fp_armory;
btn_lift_floor[?"scaryVoice"] = rm_none;
btn_lift_floor[?"none"] = rm_none;