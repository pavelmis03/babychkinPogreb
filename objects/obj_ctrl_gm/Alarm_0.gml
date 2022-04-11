/// @description таймер, в котором можно сделать что-то непосредственно перед посещением комнаты пикселей 
// оба этих таймера - система задержки перед посещением комнат истории или диалогов 

//if - костыль. почему-то cursor_sprite не срабатывает за один такт
if (cursor_sprite == -1) {
	alarm[1] = 5; //в тактах 
	obj_ctrl_gm_img.action = "createTempScreenShot"; //создаем скрин экрана
} else {
	alarm[0] = 2;
	//для посещения комнаты диалогов
	cursor_sprite = -1;		//чтобы курсора не было на скрине
}