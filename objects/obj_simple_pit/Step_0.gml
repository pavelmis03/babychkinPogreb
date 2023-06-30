/// @description 

if (pit_buhReceiveDmg) {
	if (instance_exists(obj_buh)) {	//если буханка в комнате есть
		//если она достаточно далеко отъехала от ямы 
		if (distance_to_object(obj_buh) > 0) {
			//сбрасываем флажок полученного буханкой урона (теперь снова можно получать урон при наезде на яму)
			pit_buhReceiveDmg = false;
		}
	}
}


