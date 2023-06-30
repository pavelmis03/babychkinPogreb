/// @description выполняет отрисовку 

//main 
action = "";
interface_on = false;	//если 1, то отображается интерфейс игрока: патроны, hp и т.д.
//interface_canOn = true;	//можно ли показывать интерфей (0, если игрок мертв или не существует)
//помещаю кнопку активации инвентаря в угол экрана


//вспомогательные переменные
draw_buh_battery = -12.4;//аккмулятор
draw_buh_oil = 0;		//масло
draw_buh_temp = 0;		//температура 
draw_buh_mileageLast = obj_ctrl_gm_buh.buh_mileage;	//проверка на изменение пробега
draw_buh_mileage = [];		//индексы спрайтов с цифрами для каждой цифры
draw_buh_fuelWarning = 0;	//моргание значка топлива
var t = round(obj_ctrl_gm_buh.buh_mileage);
for (var i = 0; i < 6; i++) {
	array_push(draw_buh_mileage, t % 10);
	t = floor(t / 10);
}
alarm[3] = 1 * room_speed;	//таймер для дергающихся стрелок датчиков буханки