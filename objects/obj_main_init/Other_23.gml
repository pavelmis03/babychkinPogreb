/// @description константы

//СИСТЕМНЫЕ КОНСТАНТЫ
//словарь информации о комнате, нужен для 
//для определения локации по комнате
//определения типа игрока по комнате
global.CONST_MAP_RM_INFO = ds_map_create();

//ОПИСАНИЕ ПРЕДМЕТОВ

//все, что можно съесть и влияние этого на параметры игрока
global.CONST_MAP_PRODUCT = ds_map_create();

//описание оружия
global.CONST_MAP_WEAPON = ds_map_create();

//чертежи и карты
global.CONST_MAP_DRAWINGS = ds_map_create();

//гипотетические предметы
global.CONST_MAP_AMULET = ds_map_create();		//!НЕ ГОТОВО

//описаник патронов
global.CONST_MAP_PATRON = ds_map_create();

//вещи
global.CONST_CLOTHES = ds_map_create();

//описание предметов
global.CONST_MAP_ITEMS = ds_map_create();

//описание врагов
global.CONST_MAP_ENEMY = ds_map_create();

//описание остальных персонажей
global.CONST_MAP_NPC = ds_map_create();

//вес
//global.CONST_MAP_WEIGHT = ds_map_create();		//!НЕ ГОТОВО

{//ПРОДУКТЫ, НАПИТКИ И МЕДИКАМЕНТЫ
		//влияние на здоровье, голод, жажду, тепло, шизу, усталость, эффект
		//каждое значение задано границами рандома
global.CONST_MAP_PRODUCT[?"nut"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"apple"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"cucumber"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"carrot"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"friedPotatoe"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"boiledPotato"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"rolton"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"doshirak"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"pasta"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"chips"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"crackers"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"stewedMeat"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"warmMeat"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"armyConcentrate"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"bread"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"buckwheat"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"hallucinMeat"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"rottenMeat"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"rawMeat"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"friedMeat"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"water"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"soda"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"cola"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"tea"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"coffe"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"alcohol"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"beer"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"vodka"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"SSSRVodka"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"cognac"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"diesel"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"bandage"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"sterileBandage"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];							
global.CONST_MAP_PRODUCT[?"stimulator"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"aspirin"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"pills"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"firstAid"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"armyFirstAid"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"bloodBag"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"adrenaline"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"antiradin"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
global.CONST_MAP_PRODUCT[?"aspirin	"] = [[5, 10] /*жизни*/, [5, 10] /*голод*/,
							[0, 10] /*жажда*/, [5, 10] /*тепло*/, 
							[5, 10] /*шизу*/, [5, 10] /*усталость*/, 
							[] /*эффекты*/];
}

{//ПАТРОНЫ
	//скорость полета пули, пробиваемость предметов (0-5)
global.CONST_MAP_PATRON[?"makarov"] = [[20, 30], /*скорость полета*/ [1, 1] /*пробиваемость*/];
global.CONST_MAP_PATRON[?"auto"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
global.CONST_MAP_PATRON[?"drob"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
global.CONST_MAP_PATRON[?"machine"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
global.CONST_MAP_PATRON[?"rocket"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
global.CONST_MAP_PATRON[?"HIAC1"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
global.CONST_MAP_PATRON[?"HIAC2"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
global.CONST_MAP_PATRON[?"grenade1"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
global.CONST_MAP_PATRON[?"grenade2"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
global.CONST_MAP_PATRON[?"coctail"] = [[20, 30], /*скорость полета*/ [1, 1]/*пробиваемость*/];
}

{//ОДЕЖДА
//сопротивление холоду, урону, скорость, радиации, перегреву, уважение (все в процентах)
global.CONST_CLOTHES[?"valenki"] = [15, /*холод*/ 
									4, /*урону*/ 
									8, /*скорость*/ 
									0, /*радиации*/
									5, /*перегрев*/
									0];/*уважение*/
global.CONST_CLOTHES[?"cap"] = [4, /*холод*/ 
								0, /*урону*/ 
								0, /*скорость*/ 
								0, /*радиация*/ 
								0, /*перегрев*/
								20];/*уважение*/
global.CONST_CLOTHES[?"goldWatch"] = [0, /*холод*/ 
									  3, /*урону*/ 
									  0, /*скорость*/ 
									  0, /*радиация*/ 
									  0, /*перегрев*/
									  70];/*уважение*/
global.CONST_CLOTHES[?"downJacket"] = [20,  /*холод*/ 
										5,  /*урону*/ 
										-2, /*скорость*/ 
										0,  /*радиация*/ 
										10, /*перегрев*/
										0]; /*уважение*/
global.CONST_CLOTHES[?"steelworkerSuit"] = [10, /*холод*/ 
											10, /*урону*/ 
											-5, /*скорость*/ 
											5,  /*радиация*/ 
											100,/*перегрев*/
											10];/*уважение*/
global.CONST_CLOTHES[?"antiradiationSuit"] = [0, /*холод*/ 
											  0, /*урону*/ 
											  -7, /*скорость*/ 
											  100,/*радиация*/ 
											  0,  /*перегрев*/
											  0]; /*уважение*/
global.CONST_CLOTHES[?"bulletproof"] = [4, /*холод*/ 
										15, /*урону*/ 
										-5, /*скорость*/ 
										0,  /*радиация*/ 
										0,  /*перегрев*/
										0]; /*уважение*/
global.CONST_CLOTHES[?"snowshoes"] = [0, /*холод*/ 
									  0, /*урону*/ 
									  10,/*скорость*/ 
									  0, /*радиация*/ 
									  0, /*перегрев*/
									  0];/*уважение*/

}

{//ОРУЖИЕ
//урон, патронов в обойме, скорострельность, скорость износа за выстрел, время действия, радиус поражения, грохот выстрела
global.CONST_MAP_WEAPON[?"makarov"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"makarov_M"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"auto"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"auto_M"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"auto_M2"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"drob"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"machine"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"rocket"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"HIAC1"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"HIAC2"] = [[10, 20], /*урон*/
							10,		  /*патронов*/
							[2, 3],	  /*скорострельность*/
							[2, 3],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							1,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
	//А ТАК ЖЕ МОДИФИКАЦИИ ОНИХ					
global.CONST_MAP_WEAPON[?"grenade1"] = [[10, 20], /*урон*/
							1,		  /*патронов*/
							[1, 1],	  /*скорострельность*/
							[0, 0],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							10,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"grenade2"] = [[10, 20], /*урон*/
							1,		  /*патронов*/
							[1, 1],	  /*скорострельность*/
							[0, 0],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							10,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
global.CONST_MAP_WEAPON[?"coctail"] = [[10, 20], /*урон*/
							1,		  /*патронов*/
							[1, 1],	  /*скорострельность*/
							[0, 0],	  /*износ в процентах*/
							[3, 4],	  /*время действия/жизни*/
							10,		  /*радиус поражения*/
							[10, 20]];/*шум выстрела*/
}
	
{//ЧЕРТЕЖИ И КАРТЫ
	//есть или нет, при определенных действиях будет проверяться наличие
global.CONST_MAP_DRAWINGS[?"tunnelMap1"] = [false];
global.CONST_MAP_DRAWINGS[?"tunnelMap2"] = [false];
global.CONST_MAP_DRAWINGS[?"tunnelMap3"] = [false];
global.CONST_MAP_DRAWINGS[?"tunnelMap4"] = [false];
global.CONST_MAP_DRAWINGS[?"tunnelMap5"] = [false];
global.CONST_MAP_DRAWINGS[?"ghostTownMap1"] = [false];
global.CONST_MAP_DRAWINGS[?"ghostTownMap2"] = [false];
global.CONST_MAP_DRAWINGS[?"ghostBaseMap1"] = [false];
global.CONST_MAP_DRAWINGS[?"ghostBaseMap2"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifMakarov1"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifMakarov2"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifAuto1"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifAuto2"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifAuto3"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifHIAC1"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifHIAC2"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifHIAC3"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifHIAC4"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingModifHIAC5"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingRocket1"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingRocket2"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingGrenade1"] = [false];
global.CONST_MAP_DRAWINGS[?"drawingGrenade2"] = [false];
global.CONST_MAP_DRAWINGS[?"repairInstructionAuto"] = [false];
global.CONST_MAP_DRAWINGS[?"repairInstructionMakarov"] = [false];
global.CONST_MAP_DRAWINGS[?"mechanicTextbook1"] = [false];
global.CONST_MAP_DRAWINGS[?"mechanicTextbook2"] = [false];
global.CONST_MAP_DRAWINGS[?"mechanicTextbook3"] = [false];
global.CONST_MAP_DRAWINGS[?"engineeringTextbook"] = [false];
global.CONST_MAP_DRAWINGS[?"engineeringTextbook"] = [false];
global.CONST_MAP_DRAWINGS[?"psychologyTextbook"] = [false];
global.CONST_MAP_DRAWINGS[?"equipmentTextbook"] = [false];
global.CONST_MAP_DRAWINGS[?"instructionsInstallingTurret"] = [false];
global.CONST_MAP_DRAWINGS[?"instructionsCreatingTurret1"] = [false];
global.CONST_MAP_DRAWINGS[?"instructionsCreatingTurret2"] = [false];

}
	
{//ИНВЕНТАРЬ
//описание предметов для инвентаря и журнала, здесь же вес
global.CONST_MAP_ITEMS[?""] = ["", //название для игрока
							1, //вес
							-1, //кол-во предметов на инвентарь
							-1, //кол-во предметов на ячейку
							"", //тип предмета (пища, снаряга, инструменты, детали, сюжет, мусор)
							"", //описание предмета
							"", //применение (для чего нужен) (крафт, продажа, использование)
							"", //редкость (Обычный , редкий, сюжетный, коллекционный)
							[10, 20], //цена покупки и продажи (нельзя продать сюжетный или коллекционный, если -1 - цена, тоже нельзя)
							[1, 1], //количество предмедметов в коробке
							10,	//жизни предмета
							false, //нужно ли удалять предмет после того, как он был поднят
];
	
global.CONST_MAP_ITEMS[?"parent"] = ["", //название для игрока
							1, //вес
							-1, //кол-во предметов на инвентарь
							-1, //кол-во предметов на ячейку
							"", //тип предмета (пища, снаряга, инструменты, детали, сюжет, мусор)
							"", //описание предмета
							"", //применение (для чего нужен) (крафт, продажа, использование)
							"", //редкость (Обычный , редкий, сюжетный, коллекционный)
							[10, 20], //цена покупки и продажи (нельзя продать сюжетный или коллекционный, если -1 - цена, тоже нельзя)
							[1, 1], //количество предмедметов в коробке
							10,	//жизни предмета
							false, //нужно ли удалять предмет после того, как он был поднят
];
	
}

{//ВРАГИ
//характеристики врагов
global.CONST_MAP_ENEMY[?""] = ["", //название для игрока
							1, //скорость
							100, //жизни
							[10], //урон (ближний бой, дальний1, дальний2, ...)
							"", //тип врага (человек, монстр, механизм, ...)
							"", //описание монстра
							"", //редкость (Обычный , редкий, сюжетный, коллекционный)
							10, //дальность зрения
							150 //дистанция рандомной хотьбы
];
global.CONST_MAP_ENEMY[?"pank1"] = ["", //название для игрока
							2, //скорость
							100, //жизни
							[50], //урон (ближний бой, дальний1, дальний2, ...)
							"", //тип врага (человек, монстр, механизм, ...)
							"", //описание монстра
							"", //редкость (Обычный , редкий, сюжетный, коллекционный)
							150, //дальность зрения
							150  //дистанция рандомной хотьбы
];
	
}

{//ОПИСАНИЕ ПЕРСОНАЖЕЙ И ЖИВОТНЫХ
global.CONST_MAP_NPC[?""] = ["", //название для игрока
							-1, //скорость
							-1, //жизни
							"", //тип
							"", //описание 
];
global.CONST_MAP_NPC[?"stepan"] = ["Степашка", //название для игрока
							-1, //скорость
							-1, //жизни
							"npc", //тип
							"Степашка - простой парень, личный секретарь начальника КГБ", //описание 
];

}

//{//ВЕС, МАКС. КОЛИЧЕСТВО И ЦЕНА
//	//вес, макс. кол-во на инвентарь, кол-во предметов на ячейку инвентаря, цена продажи (цена покупки на 25-45% дороже)
	
//global.CONST_MAP_WEIGHT[?""] = [1, /*вес*/ -1, -1,/*кол-во*/ 10/*цена макс*/, 20/*цена мин*/];
//global.CONST_MAP_WEIGHT[?""] = [1, /*вес*/ -1, -1,/*кол-во*/ 10/*цена макс*/, 20/*цена мин*/];
//}

{//ОПИСАНИЕ КОМНАТ
	//["Офис Леонида", obj_player_FP, ...] 
	//["rm_gm...", "Комната управления ракетой (мини-игра)", "", ...] (Игрока создавать не надо)
	//["название локации комнаты", какого игрока нужно создать в данной комнате]
global.CONST_MAP_RM_INFO[?rm_gm_fp_office] = ["Офис Леонида", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_floor1] = ["Главное управление МВД", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_floor2] = ["Главное управление МВД", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_floor3] = ["Главное управление МВД", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_floor4] = ["Главное управление МВД", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_bossFloor] = ["Главное управление МВД", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_hole] = ["Первый этаж мвд", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_torture] = ["Допросная", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_armory] = ["Оружейная", obj_player_FP];
global.CONST_MAP_RM_INFO[?rm_gm_fp_parking] = ["Подземная парковка", obj_player_FP];
//global.CONST_MAP_RM_INFO[?rm_gm_fp_elevator] = ["Офис Леонида", obj_player_FP];
}