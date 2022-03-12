/// @description урезанная версия кнопки: checkBtn

//!!!подгрузка настроек из файла в crreation cod

//main
//(типы и действия можно посмотреть в событиях user_event 14 и 15)
action = "";	//действие, которыое выполняет кнопка
type = ""		//тип кнопки 
//массив звуков при наведении и нажатии на кнопку
sound = []; //-1 показывает, что этой книпке не были назначены звуки


//interaction
btn_pressed = false;	//кнопку нажали
btn_enter = false;		//на кнопку навели мышь
btn_num = 0;			//только для меню статистики показывает номер кнопки в массиве

//sprite
image_speed = 0;

//drawing
draw_txt = "";
draw_txt_cl = c_black;
draw_txt_x = x;
draw_txt_y = y;



