/// @description объект выпадающего списка

//main
//(типы и действия можно посмотреть в событиях user_event 14 и 15)
action = "";	//действие, которыое выполняет кнопка
type = ""		//тип кнопки 
//массив звуков при наведении и нажатии на кнопку
sound = []; //-1 показывает, что этой книпке не были назначены звуки


//interaction
btn_pressed = false;	//кнопку нажали
btn_enter = false;		//на кнопку навели мышь
//пункты выпадающего списка
btn_list_dropEl = ds_list_create();
btn_list_dropElTxt = ds_list_create();	//заголовки пунктов

//sprite
image_speed = 0;

//drawing
draw_txt = "Menu";
draw_txt_cl = c_black;
//текст рядом (подпись)
draw_txt2 = "";
draw_txt_cl2 = c_black;
draw_txt_x2 = x;
draw_txt_y2 = y;
