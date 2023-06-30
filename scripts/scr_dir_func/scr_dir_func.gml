/// @function scr_dir_defQuarter(dir);
/// @param {} dir направление
/// @param {} part (1 - по четвертям, 2 - на 8 частей по 45, 3 - по направлениям (право, верх, лево, низ))
/// @description определяет, в какой четверти находится направление
function scr_dir_defQuarter(dir, part) {
	if (part == 1) {
		//направление по четвертям координатной плоскости
		if ((dir >= 0) and (dir < 90)) {
			return 1;
		}
		if ((dir >= 90) and (dir < 180)) {
			return 2;
		}
		if ((dir >= 180) and (dir < 270)) {
			return 3;
		}
		if ((dir >= 270) and (dir < 360)) {
			return 4;
		}
	} 
	
	if (part == 2) {
		//направление по восьмым частям координатной плоскости
		if ((dir >= 0) and (dir < 45)) {
			return 1;
		}
		if ((dir >= 45) and (dir < 90)) {
			return 2;
		}
		if ((dir >= 90) and (dir < 135)) {
			return 3;
		}
		if ((dir >= 135) and (dir < 180)) {
			return 4;
		}
		if ((dir >= 180) and (dir < 225)) {
			return 5;
		}
		if ((dir >= 225) and (dir < 270)) {
			return 6;
		}
		if ((dir >= 270) and (dir < 315)) {
			return 7;
		}
		if ((dir >= 315) and (dir < 360)) {
			return 8;
		}
	}
	
	if (part == 3) {
		//направление по сторонам право, верх, лево, низ
		if ((dir >= 315) or (dir < 45)) {
			return 1;	//право
		}
		if ((dir >= 45) and (dir < 135)) {
			return 2;	//верх
		}
		if ((dir >= 135) and (dir < 225)) {
			return 3;	//лево
		}
		if ((dir >= 225) and (dir < 315)) {
			return 4;	//низ
		}
	}
}