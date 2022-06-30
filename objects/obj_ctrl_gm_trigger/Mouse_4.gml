//если триггер или метка по клику
if (string_copy(type, 0, 5) == "click") {
	//выполнение действия
	if (action != "") {
		event_user(15);
		action = "";	
	}
}