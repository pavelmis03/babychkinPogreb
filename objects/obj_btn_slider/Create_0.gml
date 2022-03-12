/// @description объект кнопки 
//!!!подгрузка настроек из файла в crreation cod

//main
//(типы и действия можно посмотреть в событиях user_event 14 и 15)
action = "";	//действие, которыое выполняет кнопка
type = ""		//тип кнопки 
//массив звуков при наведении и нажатии на кнопку
sound = []; //-1 показывает, что этой книпке не были назначены звуки
//init = false;
val = 100;	//значение

//interaction
btn_pressed = false;	//кнопку нажали
btn_enter = false;		//на кнопку навели мышь

//sprite
image_speed = 0;

//pos
btn_slider_right_x = x + 100;	//правая граница, до которой можно дотянуть ползунок
btn_slider_left_x = x;			//левая граница, до которой можно дотянуть ползунок


//drawing
draw_txt = "";
draw_txt_cl = c_black;
draw_txt_x = x;
draw_txt_y = y;


