/// @description 


//изменяем направление и скорость в соответствии с изменениями контроллера 
//если метель закончилась и контроллер удалился, долетаем до конца вида сами по себе
if (instance_exists(obj_ctrl_gm_snow)) {
	var tarr = obj_ctrl_gm_snow.snow_groupParamsCurr[snow_group];
	speed = snow_startSpd * tarr[0];
	//чтобы не слишком отклонялось от стартового направления 
	//direction = clamp(snow_startDir + tarr[1], snow_startDir - snow_startDir * 0.6, snow_startDir * 1.6);
	//direction = clamp(snow_startDir + tarr[1], snow_startDir - 35, snow_startDir + 35);
	direction = snow_startDir + tarr[1];
} else {
	speed = snow_startSpd;
	direction = snow_startDir;
}

//уменьшаю время жизни
snow_liveTime--;