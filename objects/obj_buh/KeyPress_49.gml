/// @description 1ая передача

//если нажато сцепление (оно не может быть нажато, если игрок не в машине и она не заведена)
if (buh_coupling) {
	buh_transmission = 1;
	speed += 3 / 3.6;	//на первой передаче мы едем на холостых
}