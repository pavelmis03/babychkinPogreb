/// @description настройка видимости

switch (type) {
	//триггер по позиции
	case "posT":
		visible = false;
	break;
	//метка по позиции
	case "posM":
		visible = true;
		sprite_index = spr_gm_plot_mark;
	break;
	//триггер по клику
	case "clickT":
		visible = false;
	break;
	//метка по клику
	case "clickM":
		visible = true;
		sprite_index = spr_gm_plot_mark;
	break;
}
visible = true;	//!D
init = true;