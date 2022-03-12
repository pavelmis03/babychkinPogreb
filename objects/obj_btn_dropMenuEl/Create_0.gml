/// @description объект выпадающего списка

//main
//(типы и действия можно посмотреть в событиях user_event 14 и 15)
action = "";	//действие, которыое выполняет кнопка
type = ""		//тип кнопки 
//массив звуков при наведении и нажатии на кнопку
sound = []; //-1 показывает, что этой книпке не были назначены звуки
iid = 0;	//id вызывающего (создающего)

//interaction
btn_pressed = false;	//кнопку нажали
btn_enter = false;		//на кнопку навели мышь

//sprite
image_speed = 0;

//drawing
draw_txt = "Menu";
draw_txt_cl = c_black;
draw_txt_x = x + 10;
draw_txt_y = y + 5;
