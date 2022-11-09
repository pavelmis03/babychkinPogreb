/// @description родительский элемент для всех мирных npc


//main
action = "";
type = "npc";
init = false;	//инициализация
npc_keyName = "";		//ключ для константного массива (см. инициализацию)
//npc_isCustom = false;	//задается в creation code и отвечает на вопрос: 
						//задаются ли переменные hp, damage и пр (см. user_ev(0)) вручную или берутся из констант

//interaction
//npc_needAttack = false;	//если тру, враг движется к игроку
//npc_attack = false;		//атака игрока

//drawing
npc_isDrawHp = false;	//нужно ли отображать жизни
//основные спрайты
npc_spr_go = spr_sys_none;
npc_spr_state = spr_sys_none;
//npc_spr_attack = spr_sys_none;

//setting

