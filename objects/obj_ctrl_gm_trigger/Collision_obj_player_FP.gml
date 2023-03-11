//если триггер или метка по позиции
if (string_copy(type, 0, 3) == "pos") {
	//выполнение действия
	if (action != "") {
		event_user(15);
		//action = "";
	}
}

