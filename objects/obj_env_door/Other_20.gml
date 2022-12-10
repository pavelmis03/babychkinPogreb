/// @description событие, которое выполняется, когда персонаж рядом и смотрит под нужным углом + взаимодействует 
	//именно с этим объектом, см. step родителя


//добавление подсказки (если дверь открыта, подсказка на закрытие и наоборот)
if (destination == "pre_room") {
	obj_ctrl_gm_hint.ctrl_hint_newHint = "closeDoor";
} else {
	obj_ctrl_gm_hint.ctrl_hint_newHint = "openDoor";
}

