/// @description следит за всеми показателями персонажа, меняет их при необходимости 

//main 
action = "";
need_sv = 2;	//нужно ли сохранять данный объект

//параметры персонажа
hp = 1080;
player_preHp = 1080;		//предыдущее значение жизней (для проверки, что игрок не получает урон)
player_dmgTimeLess = 0;	//сколько времени прошло с момента получения последнего урона 
								//нужно (10сек) для восстановления жизней от 1 до 120
player_sysParam = {	//структура системных параметров игрока
	x : 0,
	y : 0,
}
	

//быстрый бег
player_runTimeLess = 0;	//сколько времени прошло с момента прекращения бега
								//нужно для восстановления сил для бега
player_runPowerEnded = 0;	//если энергия была потрачена более, чем на 80%, нужно подождать,
								//пока восстановится не меньше 40%
player_runPower = 100;	//силы для бега

