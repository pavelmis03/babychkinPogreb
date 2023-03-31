/// @description отвечает за сохранение и загрузку игры

//main
action = "";

//SAVES
/*
	теперь все объекты, которые нужно сохранять, будут иметь переменную need_sv = 1
	и все их переменные будут сохраняться полностью
	также будут переменные с need_sv = 2 (перемещающиеся по комнатам), 
	в основном это контроллеры, каждый из перемещающихся объектов постоянен всегда,
	поэтому мы всегда сохраняем их в отдельный файл travelersObj.txt,
	перезаписывая его при сохранении комнаты (каждый из этих объектов всегда существует в текущей комнате при сохранении)
	
*/
//!сохранение директорий без слеша на конце!: ctrl_sv_gmDir = "saves/game_n"
//директория игры (saves/game_n)
ctrl_sv_gmDir = "";	//ее буду определять позже в меню загрузки игры
//директория загрузки игры game_n/save_n
ctrl_sv_ldDir = "";	//если новая игра, ctrl_sv_ldDir = "newGm", иначе передается из меню загрузки игры
//директория сохранения игры game_n/save_n
ctrl_sv_svDir = "";	
ctrl_sv_ldRms = [];	//массив комнат, которые были сохранены в данной игровой сессии
	//нужен, чтобы при перемещениях между сохранениями обновлять постоянные комнаты, сбрасывая
	//изменения, сделанные в другой игровой сессии или сохранении (обновляются все комнаты, не отраженные в данном сохранении)
ctrl_sv_ldRmsTmp = [];	//массив комнат, которые нужно будет загрузить
ctrl_sv_isRmPers = -1;	//нужен только для перезагрузки комнат, чтобы потом вернуть им постоянность
//переменная сохранения, true до тех пор, пока идет сохранение данных
//ctrl_sv_saving = 0; //0 - не сохраняется. 1 - комната пикселей. 2 - сохранение идет сейчас. 3 - сохранение закончено 

















