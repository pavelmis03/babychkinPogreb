/// @description 

switch (type) {
	//триггер по позиции
	case "posT":
		visible = false;
	break;
	//метка по позиции
	case "posM":
		visible = true;
	break;
	//триггер по клику
	case "clickT":
		visible = false;
	break;
	//метка по клику
	case "clickM":
		visible = true;
	break;
}

init = true;