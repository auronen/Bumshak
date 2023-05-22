// func void update_choicebox(var string par0);

// func void apply_options_performance();

// func void apply_options_video();

// func void apply_options_audio();

// func void apply_options_game();

// func void apply_options_controls();

// func int playvideo(var string par0);

const string menu_back_pic = "menu_ingame.tga";

const string menu_item_back_pic = "";

const string menu_choice_back_pic = "menu_choice_back.tga";

const string menu_slider_back_pic = "menu_slider_back.tga";

const string menu_slider_pos_pic = "menu_slider_pos.tga";

const string menu_input_back_pic = "";

const string menu_kbdinput_back_pic = "";

const string menu_saveload_back_pic = "menu_saveload_back.tga";

const string log_back_pic = "log_back.tga";

const string log_viewer_back_pic = "log_paper.tga";

const string stat_back_pic = "status_back.tga";

const string menu_font_default = "font_old_20_white.tga";

const string menu_font_small = "font_old_10_white.tga";

const string menu_font_bright = "font_old_10_white_hi.tga";

const string log_font_default = "font_old_10_white.tga";

const string log_font_viewer = "font_old_10_white.tga";

const string log_font_datetime = "font_old_10_white_hi.tga";

const string stat_font_default = "font_old_10_white.tga";

const int menu_slider_dx = 2000;

const int menu_slider_dy = 600;

const int menu_slider_yplus = 0;

const int menu_choice_dx = 2000;

const int menu_choice_dy = 350;

const int menu_choice_yplus = 120;

const int menu_title_y = 1200;

const int menu_start_y = 2400;

const int menu_start_sound_y = 1800;

const int menu_back_y = 6500;

const int menu_dy = 650;

const int menu_info_x = 300;

const int menu_info_y = 7780;

const int max_userstrings = 10;

const int max_items = 150;

const int max_events = 10;

const int max_sel_actions = 5;

const int max_uservars = 4;

const int sel_action_undef = 0;

const int sel_action_back = 1;

const int sel_action_startmenu = 2;

const int sel_action_startitem = 3;

const int sel_action_close = 4;

const int sel_action_concommands = 5;

const int sel_action_play_sound = 6;

const int sel_action_execcommands = 7;

const int menu_item_undef = 0;

const int menu_item_text = 1;

const int menu_item_slider = 2;

const int menu_item_input = 3;

const int menu_item_cursor = 4;

const int menu_item_choicebox = 5;

const int menu_item_button = 6;

const int menu_item_listbox = 7;

const int it_chromakeyed = 1;

const int it_transparent = 2;

const int it_selectable = 4;

const int it_moveable = 8;

const int it_txt_center = 16;

const int it_disabled = 32;

const int it_fade = 64;

const int it_effects_next = 128;

const int it_only_out_game = 256;

const int it_only_in_game = 512;

const int it_perf_option = 1024;

const int it_multiline = 2048;

const int it_needs_apply = 4096;

const int it_needs_restart = 8192;

const int it_extended_menu = 16384;

const int menu_overtop = 1;

const int menu_exclusive = 2;

const int menu_noani = 4;

const int menu_dontscale_dim = 8;

const int menu_dontscale_pos = 16;

const int menu_align_center = 32;

const int menu_show_info = 64;

const int event_undef = 0;

const int event_execute = 1;

const int event_changed = 2;

const int event_leave = 3;

const int event_timer = 4;

const int event_close = 5;

const int event_init = 6;

const int event_sel_prev = 7;

const int event_sel_next = 8;

const int close_item = 1;

class c_menu_item {
    var string fontname;
    var string text[10];
    var string backpic;
    var string alphamode;
    var int alpha;
    var int type;
    var int onselaction[5];
    var string onselaction_s[5];
    var string onchgsetoption;
    var string onchgsetoptionsection;
    var func oneventaction[10];
    var int posx;
    var int posy;
    var int dimx;
    var int dimy;
    var float sizestartscale;
    var int flags;
    var float opendelaytime;
    var float openduration;
    var float userfloat[4];
    var string userstring[4];
    var int framesizex;
    var int framesizey;
    var string hideifoptionsectionset;
    var string hideifoptionset;
    var int hideonvalue;
};

class c_menu {
    var string backpic;
    var string backworld;
    var int posx;
    var int posy;
    var int dimx;
    var int dimy;
    var int alpha;
    var string musictheme;
    var int eventtimermsec;
    var string items[150];
    var int flags;
    var int defaultoutgame;
    var int defaultingame;
};

prototype c_menu_item_def(c_menu_item) {
    	fontName 		= 	MENU_FONT_DEFAULT;
	text			=	"";
	alphaMode		=	"BLEND";
	alpha			=	254;			// NOTE: Must be under 255 to support chroma keying, chroma color is black
	type			=	MENU_ITEM_TEXT;
	posx			=	0;
	posy			=	0;
	dimx			=	-1;			// -1 = AUTODETECT
	dimy			=	-1;			// -1 = AUTODETECT
	flags			=	IT_CHROMAKEYED|IT_TRANSPARENT|IT_SELECTABLE;
	
	openDelayTime	=	0;
	openDuration	=	-1;	
	
	sizeStartScale  = 	1;
	
	userFloat[0]    =	100;	
	userFloat[1]	=	200;
	
	onSelAction[0]				= 	SEL_ACTION_BACK;
	onChgSetOption  			=	"";
	onChgSetOptionSection 		= "INTERNAL";
	hideIfOptionSectionSet		= "";
	hideIfOptionSet				= "";
	hideOnValue					= -1;
	
	frameSizeX		= 0;
	frameSizeY		= 0;
};

prototype c_menu_def(c_menu) {
    posx = 0;
    posy = 0;
    dimx = 8191;
    dimy = 8191;
    alpha = 254;
    items = "ITEM_BACK";
    flags = (menu_exclusive | menu_dontscale_dim) | menu_align_center;
    eventtimermsec = 1000;
    musictheme = "";
    defaultoutgame = -1;
    defaultingame = -1;
};

instance menu_main(c_menu_def) {
    backpic = menu_back_pic;
    musictheme = "SYS_Menu";
    items = "MENUITEM_MAIN_HEADLINE";
    items[1] = "MENUITEM_MAIN_HEADLINE2";
    items[2] = "MENUITEM_MAIN_NEWGAME";
    items[3] = "MENUITEM_MAIN_SAVEGAME_LOAD";
    items[4] = "MENUITEM_MAIN_SAVEGAME_SAVE";
    items[5] = "MENUITEM_MAIN_RESUME";
    items[6] = "MENUITEM_MAIN_OPTIONS";
    items[7] = "MENUITEM_MAIN_EXIT";
    defaultoutgame = 2;
    defaultingame = 4;
    flags = flags | menu_show_info;
};

const int menu_main_dy = 550;

const int menu_main_y = 2500;

instance menuitem_main_newgame(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Neues Spiel starten";
    text[1] = "Ein neues Spiel beginnen.";
    posx = 0;
    posy = menu_main_y + (menu_main_dy * 0);
    dimx = 8100;
    dimy = 750;
    onselaction = sel_action_close;
    onselaction_s = "NEW_GAME";
    flags = flags | it_txt_center;
};

instance menuitem_main_savegame_load(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Spiel laden";
    text[1] = "Einen gespeicherten Spielstand laden.";
    posx = 0;
    posy = menu_main_y + (menu_main_dy * 1);
    dimx = 8100;
    dimy = 750;
    onselaction_s = "MENU_SAVEGAME_LOAD";
    onselaction = sel_action_startmenu;
    flags = flags | it_txt_center;
};

instance menuitem_main_savegame_save(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Spiel speichern";
    text[1] = "Den aktuellen Spielstand speichern.";
    posx = 0;
    posy = menu_main_y + (menu_main_dy * 2);
    dimx = 8100;
    dimy = 750;
    onselaction_s = "MENU_SAVEGAME_SAVE";
    onselaction = sel_action_startmenu;
    flags = (flags | it_txt_center) | it_only_in_game;
};

instance menuitem_main_resume(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Weiterspielen";
    text[1] = "Aktuelles Spiel fortführen.";
    posx = 0;
    posy = menu_main_y + (menu_main_dy * 3);
    dimx = 8192;
    dimy = 750;
    onselaction = sel_action_back;
    flags = (flags | it_txt_center) | it_only_in_game;
};

instance menuitem_main_options(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Einstellungen";
    text[1] = "Spiel, Video, Audio und Tastatur einstellen";
    posx = 0;
    posy = menu_main_y + (menu_main_dy * 4);
    dimx = 8100;
    dimy = 750;
    onselaction = sel_action_startmenu;
    onselaction_s = "MENU_OPTIONS";
    flags = flags | it_txt_center;
};

instance menuitem_main_exit(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Spiel beenden";
    text[1] = "Das Spiel verlassen.";
    posx = 0;
    posy = menu_main_y + (menu_main_dy * 5);
    dimx = 8100;
    dimy = 750;
    onselaction = sel_action_startmenu;
    onselaction_s = "MENU_LEAVE_GAME";
    flags = flags | it_txt_center;
};

instance menuitem_main_headline2(c_menu_item_def) {
    backpic = "menu_gothic.tga";
    posx = 1100;
    posy = 500;
    dimx = 5900;
    dimy = 1800;
    alphamode = "BLEND";
    alpha = 255;
    flags = flags | it_txt_center;
    flags = flags & (~it_selectable);
};

instance menuitem_main_headline(c_menu_item_def) {
    backpic = "";
    posx = 250;
    posy = 500;
    dimx = 7900;
    dimy = 2300;
    alphamode = "BLEND";
    alpha = 220;
    flags = flags | it_txt_center;
    flags = flags & (~it_selectable);
};

instance menu_options(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENUITEM_OPT_HEADING";
    items[1] = "MENUITEM_OPT_GAME";
    items[2] = "MENUITEM_OPT_GRAPHICS";
    items[3] = "MENUITEM_OPT_VIDEO";
    items[4] = "MENUITEM_OPT_AUDIO";
    items[5] = "MENUITEM_OPT_CONTROLS";
    items[6] = "MENUITEM_OPT_EXT";
    items[7] = "MENUITEM_PERF";
    items[8] = "MENUITEM_PERF_CHOICE";
    items[9] = "MENUITEM_OPT_BACK";
    defaultoutgame = 0;
    defaultingame = 0;
    flags = flags | menu_show_info;
};

const int menu_opt_dy = 600;

const int menu_opt_start_y = 2000;

instance menuitem_opt_heading(c_menu_item_def) {
    text = "EINSTELLUNGEN";
    type = menu_item_text;
    posx = 0;
    posy = menu_title_y;
    dimx = 8192;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_opt_game(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Spiel";
    text[1] = "Diverse Spieleinstellungen vornehmen.";
    posx = 0;
    posy = menu_opt_start_y + (menu_opt_dy * 0);
    dimx = 8192;
    dimy = 750;
    onselaction = sel_action_startmenu;
    onselaction_s = "MENU_OPT_GAME";
    flags = flags | it_txt_center;
};

instance menuitem_opt_graphics(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Grafik";
    text[1] = "Sichtweite, Details und Effekte.";
    posx = 0;
    posy = menu_opt_start_y + (menu_opt_dy * 1);
    dimx = 8192;
    dimy = 750;
    onselaction = sel_action_startmenu;
    onselaction_s = "MENU_OPT_GRAPHICS";
    flags = flags | it_txt_center;
};

instance menuitem_opt_video(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Video";
    text[1] = "Grafikkarte, Auflösung und Helligkeit.";
    posx = 0;
    posy = menu_opt_start_y + (menu_opt_dy * 2);
    dimx = 8192;
    dimy = 750;
    onselaction = sel_action_startmenu;
    onselaction_s = "MENU_OPT_VIDEO";
    flags = flags | it_txt_center;
};

instance menuitem_opt_audio(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Audio";
    text[1] = "Musik, Sprache und Soundeffekte.";
    posx = 0;
    posy = menu_opt_start_y + (menu_opt_dy * 3);
    dimx = 8192;
    dimy = 750;
    onselaction = sel_action_startmenu;
    onselaction_s = "MENU_OPT_AUDIO";
    flags = flags | it_txt_center;
};

instance menuitem_opt_controls(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Steuerung";
    text[1] = "Konfiguration der Tastenbelegung.";
    posx = 0;
    posy = menu_opt_start_y + (menu_opt_dy * 4);
    dimx = 8192;
    dimy = 750;
    onselaction = sel_action_startmenu;
    onselaction_s = "MENU_OPT_CONTROLS";
    flags = flags | it_txt_center;
};

instance menuitem_opt_ext(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Erweitert";
    text[1] = "Weitere Optionen";
    posx = 0;
    posy = menu_opt_start_y + (menu_opt_dy * 5);
    dimx = 8192;
    dimy = 750;
    onselaction = sel_action_startmenu;
    onselaction_s = "MENU_OPT_EXT";
    flags = flags | it_txt_center;
};

instance menuitem_perf(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Performance/Qualität";
    text[1] = "Optimierung von Performance und Qualität.";
    posx = 0;
    posy = menu_opt_start_y + (menu_opt_dy * 6);
    dimx = 8192;
    dimy = 800;
    onselaction = sel_action_undef;
    oneventaction[1] = update_perfoptions;
    flags = flags | it_effects_next;
    flags = flags | it_txt_center;
};

instance menuitem_perf_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    text = "benutzerdefiniert#hohe Performance|mittlere Qualität|hohe Qualität";
    type = menu_item_choicebox;
    fontname = menu_font_small;
    posx = 4100 - 2000;
    posy = (menu_opt_start_y + (menu_opt_dy * 6)) + 650;
    dimx = 4000;
    dimy = 350;
    onchgsetoption = "perfQualityIndex";
    onchgsetoptionsection = "INTERNAL";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_opt_back(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Zurück";
    posx = 1000;
    posy = menu_back_y + 300;
    dimx = 6192;
    dimy = menu_opt_dy;
    onselaction = sel_action_back;
    flags = flags | it_txt_center;
};

func int update_perfoptions() {
    apply_options_performance();
    return 0;
};

instance menu_opt_game(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENUITEM_GAME_HEADLINE";
    items[1] = "MENUITEM_GAME_SUB_TITLES";
    items[2] = "MENUITEM_GAME_SUB_TITLES_CHOICE";
    items[3] = "MENUITEM_GAME_FIGHTFOCUS";
    items[4] = "MENUITEM_GAME_FIGHTFOCUS_CHOICE";
    items[5] = "MENUITEM_GAME_INTERACTFOCUS";
    items[6] = "MENUITEM_GAME_INTERACTFOCUS_CHOICE";
    items[7] = "MENUITEM_GAME_LOOKAROUND_INVERSE";
    items[8] = "MENUITEM_GAME_LOOKAROUND_INVERSE_CHOICE";
    items[9] = "MENUITEM_M";
    items[10] = "MENUITEM_M_CHOICE";
    items[11] = "MENUITEM_MSENSITIVITY";
    items[12] = "MENUITEM_MSENSITIVITY_SLIDER";
    items[13] = "MENUITEM_GAME_OLDCONTROLS";
    items[14] = "MENUITEM_GAME_OLDCONTROLS_CHOICE";
    items[15] = "MENUITEM_GAME_BACK";
    flags = flags | menu_show_info;
};

instance menuitem_game_headline(c_menu_item_def) {
    text = "SPIEL EINSTELLUNGEN";
    type = menu_item_text;
    posx = 0;
    posy = menu_title_y;
    dimx = 8100;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_game_sub_titles(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Untertitel";
    text[1] = "Visuelle Einblendung von Dialogen.";
    posx = 1000;
    posy = menu_start_y + (menu_sound_dy * 0);
    dimx = 4000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_game_sub_titles_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_sound_dy * 0)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "subTitles";
    onchgsetoptionsection = "GAME";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_game_fightfocus(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Kampf Fokus";
    text[1] = "Grad der Darstellung des Kampffokus";
    posx = 1000;
    posy = menu_start_y + (menu_sound_dy * 1);
    dimx = 4000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_game_fightfocus_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "kein|Quadrat|aufhellen|beides";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_sound_dy * 1)) + menu_choice_yplus;
    dimx = 2000;
    dimy = menu_choice_dy;
    onchgsetoption = "highlightMeleeFocus";
    onchgsetoptionsection = "GAME";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_game_interactfocus(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Interakt. Fokus";
    text[1] = "Grad der Darstellung des Interaktions-Fokus";
    posx = 1000;
    posy = menu_start_y + (menu_sound_dy * 2);
    dimx = 4000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_game_interactfocus_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_sound_dy * 2)) + menu_choice_yplus;
    dimx = 2000;
    dimy = menu_choice_dy;
    onchgsetoption = "highlightInteractFocus";
    onchgsetoptionsection = "GAME";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_game_lookaround_inverse(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Umschau umkehren";
    text[1] = "Inverse Kamerasteuerung.";
    posx = 1000;
    posy = menu_start_y + (menu_sound_dy * 3);
    dimx = 4000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_game_lookaround_inverse_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_sound_dy * 3)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "camLookaroundInverse";
    onchgsetoptionsection = "GAME";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_m(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Maus";
    text[1] = "Aktiviert eine Maussteuerung";
    posx = 1000;
    posy = menu_start_y + (menu_sound_dy * 4);
    dimx = 4000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_m_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "aus|an";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_sound_dy * 4)) + menu_choice_yplus;
    dimx = 2000;
    dimy = menu_choice_dy;
    onchgsetoption = "enableMouse";
    onchgsetoptionsection = "GAME";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_msensitivity(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Maus Empfindlichk.";
    text[1] = "";
    posx = 1000;
    posy = menu_start_y + (menu_sound_dy * 5);
    dimx = 4000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_msensitivity_slider(c_menu_item_def) {
    backpic = menu_slider_back_pic;
    type = menu_item_slider;
    text = "";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_sound_dy * 5)) + menu_slider_yplus;
    dimx = 2000;
    dimy = menu_slider_dy;
    onchgsetoption = "mouseSensitivity";
    onchgsetoptionsection = "GAME";
    userfloat = 20.0;
    userstring = menu_slider_pos_pic;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_game_oldcontrols(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Gothic 1 controls";
    text[1] = "Alte Steuerung im Kampf aktivieren";
    posx = 1000;
    posy = menu_start_y + (menu_sound_dy * 6);
    dimx = 4000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_game_oldcontrols_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "aus|an";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_sound_dy * 6)) + menu_choice_yplus;
    dimx = 2000;
    dimy = menu_choice_dy;
    onchgsetoption = "useGothic1Controls";
    onchgsetoptionsection = "GAME";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_game_back(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Zurück";
    posx = 1000;
    posy = menu_back_y;
    dimx = 6192;
    dimy = menu_sound_dy;
    onselaction = sel_action_back;
    flags = flags | it_txt_center;
};

instance menu_opt_graphics(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENUITEM_GRA_HEADLINE";
    items[1] = "MENUITEM_GRA_TEXQUAL";
    items[2] = "MENUITEM_GRA_TEXQUAL_SLIDER";
    items[3] = "MENUITEM_GRA_MODEL_DETAIL";
    items[4] = "MENUITEM_GRA_MODEL_DETAIL_SLIDER";
    items[5] = "MENUITEM_GRA_SIGHT";
    items[6] = "MENUITEM_GRA_SIGHT_CHOICE";
    items[7] = "MENUITEM_VOB_SIGHT";
    items[8] = "MENUITEM_VOB_SIGHT_CHOICE";
    items[9] = "MENUITEM_GRA_SKY_EFFECTS";
    items[10] = "MENUITEM_GRA_SKY_EFFECTS_CHOICE";
    items[11] = "MENUITEM_GRA_BACK";
    flags = flags | menu_show_info;
};

instance menuitem_gra_headline(c_menu_item_def) {
    text = "GRAFIK EINSTELLUNGEN";
    type = menu_item_text;
    posx = 0;
    posy = menu_title_y;
    dimx = 8100;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_gra_texqual(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Textur Details";
    text[1] = "Detailstufe der Texturen.";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 0);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_gra_texqual_slider(c_menu_item_def) {
    backpic = menu_slider_back_pic;
    type = menu_item_slider;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 0)) + menu_slider_yplus;
    dimx = menu_slider_dx;
    dimy = menu_slider_dy;
    onchgsetoption = "texDetailIndex";
    onchgsetoptionsection = "INTERNAL";
    userfloat = 5.0;
    userstring = menu_slider_pos_pic;
    flags = flags & (~it_selectable);
    flags = ((flags | it_txt_center) | it_perf_option) | it_needs_restart;
};

instance menuitem_gra_model_detail(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Modell Details";
    text[1] = "Detailstufe von Objekten.";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 1);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_gra_model_detail_slider(c_menu_item_def) {
    backpic = menu_slider_back_pic;
    type = menu_item_slider;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 1)) + menu_slider_yplus;
    dimx = menu_slider_dx;
    dimy = menu_slider_dy;
    onchgsetoption = "modelDetail";
    onchgsetoptionsection = "PERFORMANCE";
    userfloat = 10.0;
    userstring = menu_slider_pos_pic;
    flags = flags & (~it_selectable);
    flags = flags | it_perf_option;
};

instance menuitem_gra_sight(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Sichtweite";
    text[1] = "Regelung der Sichtweite in Prozent.";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 2);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_gra_sight_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 2)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "sightValue";
    onchgsetoptionsection = "PERFORMANCE";
    flags = flags & (~it_selectable);
    flags = (flags | it_perf_option) | it_txt_center;
};

instance menuitem_vob_sight(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Sichtweite Obj";
    text[1] = "Regelung der Objekt Sichtweite in Prozent";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 3);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_vob_sight_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "20%|40%|60%|80%|100%|120%|140%|160%|180%|200%|220%|240%|260%|280%|300%";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 3)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "zVobFarClipZScale";
    onchgsetoptionsection = "ENGINE";
    flags = flags & (~it_selectable);
    flags = (flags | it_perf_option) | it_txt_center;
};

instance menuitem_gra_sky_effects(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Himmeleffekte";
    text[1] = "Himmeleffekte an- bzw. abschalten.";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 4);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_gra_sky_effects_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 4)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "skyEffects";
    onchgsetoptionsection = "GAME";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_gra_back(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Zurück";
    posx = 1000;
    posy = menu_back_y + 300;
    dimx = 6192;
    dimy = menu_dy;
    onselaction = sel_action_back;
    flags = flags | it_txt_center;
};

instance menu_opt_video(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENUITEM_VID_HEADLINE";
    items[1] = "MENUITEM_VID_DEVICE";
    items[2] = "MENUITEM_VID_DEVICE_CHOICE";
    items[3] = "MENUITEM_VID_RESOLUTION";
    items[4] = "MENUITEM_VID_RESOLUTION_CHOICE";
    items[5] = "MENUITEM_VID_BRIGHTNESS";
    items[6] = "MENUITEM_VID_BRIGHTNESS_SLIDER";
    items[7] = "MENUITEM_VID_CONTRAST";
    items[8] = "MENUITEM_VID_CONTRAST_SLIDER";
    items[9] = "MENUITEM_VID_GAMMA";
    items[10] = "MENUITEM_VID_GAMMA_SLIDER";
    items[11] = "MENUITEM_VID_BACK";
    flags = flags | menu_show_info;
};

instance menuitem_vid_headline(c_menu_item_def) {
    text = "VIDEO EINSTELLUNGEN";
    type = menu_item_text;
    posx = 0;
    posy = menu_title_y;
    dimx = 8100;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_vid_device(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Grafikkarte";
    text[1] = "Gothic muss für diese Option neu gestartet werden!";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 0);
    dimx = 3000;
    dimy = 600;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_vid_device_choice(c_menu_item_def) {
    text = "";
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    fontname = menu_font_small;
    posx = 3700;
    posy = (menu_start_y + (menu_dy * 0)) + menu_choice_yplus;
    dimx = 3700;
    dimy = menu_choice_dy;
    onchgsetoption = "zVidDevice";
    onchgsetoptionsection = "VIDEO";
    oneventaction[6] = update_videooptions;
    flags = flags & (~it_selectable);
    flags = (flags | it_txt_center) | it_needs_restart;
};

instance menuitem_vid_resolution(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Auflösung";
    text[1] = "Gewählte Auflösung durch RETURN bestätigen.";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 1);
    dimx = 2700;
    dimy = 600;
    onselaction = sel_action_undef;
    oneventaction[1] = apply_videoresolution;
    flags = flags | it_effects_next;
};

instance menuitem_vid_resolution_choice(c_menu_item_def) {
    text = "";
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    fontname = menu_font_small;
    posx = 3700;
    posy = (menu_start_y + (menu_dy * 1)) + menu_choice_yplus;
    dimx = 3700;
    dimy = menu_choice_dy;
    onchgsetoption = "vidResIndex";
    onchgsetoptionsection = "INTERNAL";
    flags = flags & (~it_selectable);
    flags = (flags | it_txt_center) | it_needs_apply;
};

instance menuitem_vid_brightness(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Helligkeit";
    text[1] = "Helligkeit";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 3);
    dimx = 2700;
    dimy = 600;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_vid_brightness_slider(c_menu_item_def) {
    backpic = menu_slider_back_pic;
    type = menu_item_slider;
    posx = 3700;
    posy = (menu_start_y + (menu_dy * 3)) + menu_slider_yplus;
    dimx = menu_slider_dx;
    dimy = menu_slider_dy;
    onchgsetoption = "zVidBrightness";
    onchgsetoptionsection = "VIDEO";
    userfloat = 35.0;
    userstring = menu_slider_pos_pic;
    flags = flags & (~it_selectable);
};

instance menuitem_vid_contrast(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Kontrast";
    text[1] = "Kontrast";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 4);
    dimx = 2700;
    dimy = 600;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_vid_contrast_slider(c_menu_item_def) {
    backpic = menu_slider_back_pic;
    type = menu_item_slider;
    posx = 3700;
    posy = (menu_start_y + (menu_dy * 4)) + menu_slider_yplus;
    dimx = menu_slider_dx;
    dimy = menu_slider_dy;
    onchgsetoption = "zVidContrast";
    onchgsetoptionsection = "VIDEO";
    userfloat = 35.0;
    userstring = menu_slider_pos_pic;
    flags = flags & (~it_selectable);
};

instance menuitem_vid_gamma(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Gamma";
    text[1] = "Gamma";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 5);
    dimx = 2700;
    dimy = 600;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_vid_gamma_slider(c_menu_item_def) {
    backpic = menu_slider_back_pic;
    type = menu_item_slider;
    posx = 3700;
    posy = (menu_start_y + (menu_dy * 5)) + menu_slider_yplus;
    dimx = menu_slider_dx;
    dimy = menu_slider_dy;
    onchgsetoption = "zVidGamma";
    onchgsetoptionsection = "VIDEO";
    userfloat = 35.0;
    userstring = menu_slider_pos_pic;
    flags = flags & (~it_selectable);
};

instance menuitem_vid_back(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Zurück";
    posx = 1000;
    posy = menu_back_y;
    dimx = 6192;
    dimy = menu_dy;
    onselaction = sel_action_back;
    flags = flags | it_txt_center;
};

func int update_videooptions() {
    update_choicebox("MENUITEM_VID_DEVICE_CHOICE");
    update_choicebox("MENUITEM_VID_RESOLUTION_CHOICE");
    return 1;
};

func int apply_videoresolution() {
    apply_options_video();
    return 0;
};

instance menu_opt_audio(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENUITEM_AUDIO_HEADLINE";
    items[1] = "MENUITEM_AUDIO_SFXVOL";
    items[2] = "MENUITEM_AUDIO_SFXVOL_SLIDER";
    items[3] = "MENUITEM_AUDIO_MUSICVOL";
    items[4] = "MENUITEM_AUDIO_MUSICVOL_SLIDER";
    items[5] = "MENUITEM_AUDIO_MUSIC";
    items[6] = "MENUITEM_AUDIO_MUSIC_CHOICE";
    items[7] = "MENUITEM_AUDIO_PROVIDER";
    items[8] = "MENUITEM_AUDIO_PROVIDER_CHOICE";
    items[9] = "MENUITEM_AUDIO_SPEEKER";
    items[10] = "MENUITEM_AUDIO_SPEEKER_CHOICE";
    items[11] = "MENUITEM_AUDIO_REVERB";
    items[12] = "MENUITEM_AUDIO_REVERB_CHOICE";
    items[13] = "MENUITEM_AUDIO_REVERB_SPEECH";
    items[14] = "MENUITEM_AUDIO_REVERB_SPEECH_CHOICE";
    items[15] = "MENUITEM_AUDIO_SAMPLERATE";
    items[16] = "MENUITEM_AUDIO_SAMPLERATE_CHOICE";
    items[17] = "MENUITEM_AUDIO_BACK";
    flags = flags | menu_show_info;
};

const int menu_sound_dy = 550;

instance menuitem_audio_headline(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "AUDIO EINSTELLUNGEN";
    type = menu_item_text;
    posx = 0;
    posy = menu_title_y;
    dimx = 8100;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_audio_sfxvol(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Sound-Lautst.";
    text[1] = "Lautstärke von Soundeffekten und Sprachausgabe.";
    posx = 1000;
    posy = menu_start_sound_y + (menu_sound_dy * 0);
    dimx = 3400;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_audio_sfxvol_slider(c_menu_item_def) {
    backpic = menu_slider_back_pic;
    type = menu_item_slider;
    posx = 4300;
    posy = menu_start_sound_y + (menu_sound_dy * 0);
    dimx = menu_slider_dx;
    dimy = menu_slider_dy;
    onchgsetoption = "soundVolume";
    onchgsetoptionsection = "SOUND";
    userfloat = 20.0;
    userstring = menu_slider_pos_pic;
    flags = flags & (~it_selectable);
};

instance menuitem_audio_musicvol(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Musik-Lautst.";
    text[1] = "Läutstärke der Hintergrundmusik.";
    posx = 1000;
    posy = menu_start_sound_y + (menu_sound_dy * 1);
    dimx = 3400;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_audio_musicvol_slider(c_menu_item_def) {
    backpic = menu_slider_back_pic;
    type = menu_item_slider;
    posx = 4300;
    posy = menu_start_sound_y + (menu_sound_dy * 1);
    dimx = menu_slider_dx;
    dimy = menu_slider_dy;
    onchgsetoption = "musicVolume";
    onchgsetoptionsection = "SOUND";
    userfloat = 15.0;
    userstring = menu_slider_pos_pic;
    flags = flags & (~it_selectable);
};

instance menuitem_audio_music(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Musik";
    text[1] = "Hintergrundmusik an- bzw. ausschalten.";
    posx = 1000;
    posy = menu_start_sound_y + (menu_sound_dy * 2);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_audio_music_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "aus|an";
    fontname = menu_font_small;
    posx = 4300;
    posy = (menu_start_sound_y + (menu_sound_dy * 2)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "musicEnabled";
    onchgsetoptionsection = "SOUND";
    flags = flags & (~it_selectable);
    flags = ((flags | it_txt_center) | it_perf_option) | it_needs_restart;
};

instance menuitem_audio_provider(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Soundprovider";
    text[1] = "Eine Änderung wirkt sich erst beim Neustart aus!";
    posx = 1000;
    posy = menu_start_sound_y + (menu_sound_dy * 3);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_audio_provider_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "1|2|3|4|5";
    fontname = menu_font_small;
    posx = 4300;
    posy = (menu_start_sound_y + (menu_sound_dy * 3)) + menu_choice_yplus;
    dimx = 3000;
    dimy = menu_choice_dy;
    onchgsetoption = "soundProviderIndex";
    onchgsetoptionsection = "INTERNAL";
    oneventaction[6] = update_audiooptions;
    flags = flags & (~it_selectable);
    flags = ((flags | it_txt_center) | it_perf_option) | it_needs_restart;
};

instance menuitem_audio_speeker(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Lautsprecher";
    text[1] = "";
    posx = 1000;
    posy = menu_start_sound_y + (menu_sound_dy * 4);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_audio_speeker_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "2 Lautsprecher|Kopfhörer|Surround|4 Lautsprecher|5.1 Lautsprecher|7.1 Lautsprecher";
    fontname = menu_font_small;
    posx = 4300;
    posy = (menu_start_sound_y + (menu_sound_dy * 4)) + menu_choice_yplus;
    dimx = 3000;
    dimy = menu_choice_dy;
    onchgsetoption = "soundSpeakerIndex";
    onchgsetoptionsection = "INTERNAL";
    flags = flags & (~it_selectable);
    flags = (flags | it_txt_center) | it_perf_option;
};

instance menuitem_audio_reverb(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Hall-Effekt";
    text[1] = "Sollen Halleffekte in Höhlen aktiviert werden ?";
    posx = 1000;
    posy = menu_start_sound_y + (menu_sound_dy * 5);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_audio_reverb_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "aus|an";
    fontname = menu_font_small;
    posx = 4300;
    posy = (menu_start_sound_y + (menu_sound_dy * 5)) + menu_choice_yplus;
    dimx = menu_choice_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "soundUseReverb";
    onchgsetoptionsection = "SOUND";
    flags = flags & (~it_selectable);
    flags = ((flags | it_txt_center) | it_perf_option) | it_needs_restart;
};

instance menuitem_audio_reverb_speech(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Sprache-Hall";
    text[1] = "Sollen Halleffekte für Sprachausgabe aktiviert werden ?";
    posx = 1000;
    posy = menu_start_sound_y + (menu_sound_dy * 6);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_audio_reverb_speech_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "kein|wenig|viel";
    fontname = menu_font_small;
    posx = 4300;
    posy = (menu_start_sound_y + (menu_sound_dy * 6)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "useSpeechReverbLevel";
    onchgsetoptionsection = "GAME";
    flags = flags & (~it_selectable);
    flags = (flags | it_txt_center) | it_perf_option;
};

instance menuitem_audio_samplerate(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Sample-Rate";
    text[1] = "Eine Änderung wirkt sich erst beim Neustart aus!";
    posx = 1000;
    posy = menu_start_sound_y + (menu_sound_dy * 7);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_audio_samplerate_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "22 khz|44 khz";
    fontname = menu_font_small;
    posx = 4300;
    posy = (menu_start_sound_y + (menu_sound_dy * 7)) + menu_choice_yplus;
    dimx = menu_choice_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "soundSampleRateIndex";
    onchgsetoptionsection = "INTERNAL";
    flags = flags & (~it_selectable);
    flags = ((flags | it_txt_center) | it_perf_option) | it_needs_restart;
};

instance menuitem_audio_back(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Zurück";
    posx = 1000;
    posy = menu_back_y;
    dimx = 6192;
    dimy = menu_sound_dy;
    onselaction = sel_action_back;
    flags = flags | it_txt_center;
};

func int update_audiooptions() {
    update_choicebox("MENUITEM_AUDIO_PROVIDER_CHOICE");
    return 1;
};

func int apply_audioresolution() {
    apply_options_audio();
    return 0;
};

instance menu_opt_controls(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENU_ITEM_CHG_KEYS_HEADLINE";
    items[1] = "MENU_ITEM_KEY_UP";
    items[2] = "MENU_ITEM_KEY_DOWN";
    items[3] = "MENU_ITEM_KEY_LEFT";
    items[4] = "MENU_ITEM_KEY_RIGHT";
    items[5] = "MENU_ITEM_KEY_STRAFE_LEFT";
    items[6] = "MENU_ITEM_KEY_STRAFE_RIGHT";
    items[7] = "MENU_ITEM_KEY_JUMPCLIMBSTRAFE";
    items[8] = "MENU_ITEM_KEY_RUNMODETOGGLE";
    items[9] = "MENU_ITEM_KEY_SNEAK";
    items[10] = "MENU_ITEM_KEY_ACTION";
    items[11] = "MENU_ITEM_KEY_WEAPON";
    items[12] = "MENU_ITEM_KEY_MAP";
    items[13] = "MENU_ITEM_KEY_LOOK";
    items[14] = "MENU_ITEM_KEY_LOOK_FP";
    items[15] = "MENU_ITEM_KEY_INVENTORY";
    items[16] = "MENU_ITEM_KEY_SCREEN_STATUS";
    items[17] = "MENU_ITEM_KEY_SCREEN_LOG";
    items[18] = "MENU_ITEM_INP_UP";
    items[19] = "MENU_ITEM_INP_DOWN";
    items[20] = "MENU_ITEM_INP_LEFT";
    items[21] = "MENU_ITEM_INP_RIGHT";
    items[22] = "MENU_ITEM_INP_STRAFE_LEFT";
    items[23] = "MENU_ITEM_INP_STRAFE_RIGHT";
    items[24] = "MENU_ITEM_INP_JUMPCLIMBSTRAFE";
    items[25] = "MENU_ITEM_INP_RUNMODETOGGLE";
    items[26] = "MENU_ITEM_INP_SNEAK";
    items[27] = "MENU_ITEM_INP_ACTION";
    items[28] = "MENU_ITEM_INP_WEAPON";
    items[29] = "MENU_ITEM_INP_MAP";
    items[30] = "MENU_ITEM_INP_LOOK";
    items[31] = "MENU_ITEM_INP_LOOK_FP";
    items[32] = "MENU_ITEM_INP_INVENTORY";
    items[33] = "MENU_ITEM_INP_SCREEN_STATUS";
    items[34] = "MENU_ITEM_INP_SCREEN_LOG";
    items[35] = "MENU_ITEM_CHG_KEYS_SET_DEFAULT";
    items[36] = "MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE";
    items[37] = "MENUITEM_CHG_KEYS_BACK";
    items[38] = "MENU_ITEM_NEXTMENU";
    flags = flags | menu_show_info;
};

instance menu_item_nextmenu(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "weitere Tasten...";
    text[1] = "weitere Gothic 2 Tasten festlegen";
    posx = ctrl_sp1_1 + 2500;
    posy = (ctrl_y_start + (ctrl_y_step * 21)) + ctrl_group6;
    dimy = 300;
    fontname = menu_font_small;
    onselaction_s = "MENU_OPT_CONTROLS_EXTKEYS";
    onselaction = sel_action_startmenu;
    flags = flags | it_txt_center;
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
};

instance menu_opt_controls_extkeys(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENU_ITEM_CHG_EXTKEYS_HEADLINE";
    items[1] = "MENU_ITEM_KEY_WEAPON_LEFT";
    items[2] = "MENU_ITEM_KEY_WEAPON_RIGHT";
    items[3] = "MENU_ITEM_KEY_WEAPON_PARADE";
    items[4] = "MENU_ITEM_KEY_LOCKFOCUS";
    items[5] = "MENU_ITEM_KEY_QUICKMANA";
    items[6] = "MENU_ITEM_KEY_QUICKHEALTH";
    items[7] = "MENU_ITEM_INP_WEAPON_LEFT";
    items[8] = "MENU_ITEM_INP_WEAPON_RIGHT";
    items[9] = "MENU_ITEM_INP_WEAPON_PARADE";
    items[10] = "MENU_ITEM_INP_LOCKFOCUS";
    items[11] = "MENU_ITEM_INP_QUICKMANA";
    items[12] = "MENU_ITEM_INP_QUICKHEALTH";
    items[13] = "MENU_ITEM_CHG_KEYS_SET_DEFAULT";
    items[14] = "MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE";
    items[15] = "MENUITEM_CHG_KEYS_BACK";
    flags = flags | menu_show_info;
};

const int ctrl_sp1_1 = 600;

const int ctrl_sp1_2 = 3100;

const int ctrl_dimx = 4600;

const int ctrl_y_step = 260;

const int ctrl_y_step2 = 180;

const int ctrl_y_title = 500;

const int ctrl_y_start = 1020;

const int ctrl_group1 = 0;

const int ctrl_group2 = 180;

const int ctrl_group3 = 360;

const int ctrl_group4 = 540;

const int ctrl_group5 = 720;

const int ctrl_group6 = 900;

instance menu_item_key_weapon_left(c_menu_item_def) {
    text = "Schlag links";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 1)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_WEAPON_LEFT";
    fontname = menu_font_small;
    flags = flags;
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
};

instance menu_item_key_weapon_right(c_menu_item_def) {
    text = "Schlag rechts";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 2)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_WEAPON_RIGHT";
    fontname = menu_font_small;
    flags = flags;
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
};

instance menu_item_key_weapon_parade(c_menu_item_def) {
    text = "Blocken";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 3)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_WEAPON_PARADE";
    fontname = menu_font_small;
    flags = flags;
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
};

instance menu_item_inp_weapon_left(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 1)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyActionLeft";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
};

instance menu_item_inp_weapon_right(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 2)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyActionRight";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
};

instance menu_item_inp_weapon_parade(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 3)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyParade";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
};

instance menu_item_key_lockfocus(c_menu_item_def) {
    text = "Gegner Lock";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 4)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_LOCKFOCUS";
    fontname = menu_font_small;
    flags = flags;
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
};

instance menu_item_key_quickmana(c_menu_item_def) {
    text = "Manatrank";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 5)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_QUICKMANA";
    fontname = menu_font_small;
    flags = flags;
    hideifoptionsectionset = "GAME";
    hideifoptionset = "usePotionKeys";
    hideonvalue = 0;
};

instance menu_item_key_quickhealth(c_menu_item_def) {
    text = "Heiltrank";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 6)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_QUICKHEALTH";
    fontname = menu_font_small;
    flags = flags;
    hideifoptionsectionset = "GAME";
    hideifoptionset = "usePotionKeys";
    hideonvalue = 0;
};

instance menu_item_inp_lockfocus(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 4)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyLockTarget";
    onchgsetoptionsection = "KEYS";
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useGothic1Controls";
    hideonvalue = 1;
    flags = flags & (~it_selectable);
};

instance menu_item_inp_quickmana(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 5)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyPotion";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
    hideifoptionsectionset = "GAME";
    hideifoptionset = "usePotionKeys";
    hideonvalue = 0;
};

instance menu_item_inp_quickhealth(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 6)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyHeal";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
    hideifoptionsectionset = "GAME";
    hideifoptionset = "usePotionKeys";
    hideonvalue = 0;
};

instance menu_item_chg_keys_headline(c_menu_item_def) {
    text = "STEUERUNG EINSTELLUNGEN";
    type = menu_item_text;
    posx = 0;
    posy = ctrl_y_title;
    dimx = 8100;
    fontname = menu_font_bright;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menu_item_chg_extkeys_headline(c_menu_item_def) {
    text = "ERWEITERTE STEUERUNG";
    type = menu_item_text;
    posx = 0;
    posy = ctrl_y_title;
    dimx = 8100;
    fontname = menu_font_bright;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menu_item_key_up(c_menu_item_def) {
    text = "Vorwärts";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 0)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_UP";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_down(c_menu_item_def) {
    text = "Rückwärts";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 1)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_DOWN";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_left(c_menu_item_def) {
    text = "Links drehen";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 2)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_LEFT";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_right(c_menu_item_def) {
    text = "Rechts drehen";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 3)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_RIGHT";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_strafe_left(c_menu_item_def) {
    text = "Seitwärts links";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 4)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_STRAFE_LEFT";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_strafe_right(c_menu_item_def) {
    text = "Seitwärts rechts";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 5)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_STRAFE_RIGHT";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_jumpclimbstrafe(c_menu_item_def) {
    text = "Springen";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 6)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_JUMPCLIMBSTRAFE";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_runmodetoggle(c_menu_item_def) {
    text = "Gehen/Laufen";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 7)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_RUNMODETOGGLE";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_sneak(c_menu_item_def) {
    text = "Schleichen";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 8)) + ctrl_group1;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_SNEAK";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_action(c_menu_item_def) {
    text = "Aktion";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 9)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_ACTION";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_weapon(c_menu_item_def) {
    text = "Waffe ziehen";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 10)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_WEAPON";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_map(c_menu_item_def) {
    text = "Karte";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 11)) + ctrl_group2;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_MAP";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_look(c_menu_item_def) {
    text = "Umsehen";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 14)) + ctrl_group3;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_LOOK";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_look_fp(c_menu_item_def) {
    text = "FirstPerson";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 15)) + ctrl_group3;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_LOOK_FP";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_inventory(c_menu_item_def) {
    text = "Inventar";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 16)) + ctrl_group4;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_INVENTORY";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_screen_status(c_menu_item_def) {
    text = "Spielerstatus";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 17)) + ctrl_group4;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_SCREEN_STATUS";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_key_screen_log(c_menu_item_def) {
    text = "Missionen/Notizen";
    text[1] = "Taste ENTF zum Löschen und RETURN zum definieren";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 18)) + ctrl_group4;
    onselaction = sel_action_execcommands;
    onselaction_s = "RUN MENU_ITEM_INP_SCREEN_LOG";
    fontname = menu_font_small;
    flags = flags;
};

instance menu_item_inp_up(c_menu_item_def) {
    backpic = menu_kbdinput_back_pic;
    text[1] = "Gewünschte Taste betätigen.";
    type = menu_item_input;
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 0)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    onchgsetoption = "keyUp";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_down(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 1)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyDown";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_left(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 2)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyLeft";
    onchgsetoptionsection = "KEYS";
    flags = it_chromakeyed | it_transparent;
};

instance menu_item_inp_right(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 3)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyRight";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_strafe_left(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 4)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyStrafeLeft";
    onchgsetoptionsection = "KEYS";
    flags = it_chromakeyed | it_transparent;
};

instance menu_item_inp_strafe_right(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 5)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyStrafeRight";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_jumpclimbstrafe(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 6)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keySMove";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_runmodetoggle(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 7)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keySlow";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_sneak(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 8)) + ctrl_group1;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keySneak";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_action(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 9)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyAction";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_weapon(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 10)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyWeapon";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_map(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 11)) + ctrl_group2;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyShowMap";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_look(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 14)) + ctrl_group3;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyLook";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_look_fp(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 15)) + ctrl_group3;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyLookFP";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_inventory(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 16)) + ctrl_group4;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyInventory";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_screen_status(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 17)) + ctrl_group4;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyShowStatus";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_inp_screen_log(c_menu_item_def) {
    type = menu_item_input;
    text[1] = "Gewünschte Taste betätigen.";
    posx = ctrl_sp1_2;
    posy = (ctrl_y_start + (ctrl_y_step * 18)) + ctrl_group4;
    dimx = ctrl_dimx;
    dimy = 300;
    fontname = menu_font_small;
    backpic = menu_kbdinput_back_pic;
    onchgsetoption = "keyShowLog";
    onchgsetoptionsection = "KEYS";
    flags = flags & (~it_selectable);
};

instance menu_item_chg_keys_set_default(c_menu_item_def) {
    text = "Standard-Einstellung";
    text[1] = "Aktiviert die Standardbelegung.";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 19)) + ctrl_group5;
    dimy = 300;
    onselaction = sel_action_execcommands;
    onselaction_s = "SETDEFAULT";
    fontname = menu_font_small;
    flags = flags | it_txt_center;
};

instance menu_item_chg_keys_set_alternative(c_menu_item_def) {
    text = "Alternativ-Einstellung";
    text[1] = "Aktiviert eine alternative Standardbelegung.";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 20)) + ctrl_group5;
    dimy = 300;
    onselaction = sel_action_execcommands;
    onselaction_s = "SETALTERNATIVE";
    fontname = menu_font_small;
    flags = flags | it_txt_center;
};

instance menuitem_chg_keys_back(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Zurück";
    posx = ctrl_sp1_1;
    posy = (ctrl_y_start + (ctrl_y_step * 21)) + ctrl_group6;
    dimy = 300;
    fontname = menu_font_small;
    onselaction = sel_action_back;
    flags = flags | it_txt_center;
};

instance menu_opt_ext(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENUITEM_EXT_HEADLINE";
    items[1] = "MENUITEM_EXT_FFT";
    items[2] = "MENUITEM_EXT_FFT_CHOICE";
    items[3] = "MENUITEM_EXT_WATERFADE";
    items[4] = "MENUITEM_EXT_WATERFADE_CHOICE";
    items[5] = "MENUITEM_EXT_OBJWIND";
    items[6] = "MENUITEM_EXT_OBJWIND_CHOICE";
    items[7] = "MENUITEM_EXT_CLOUDSHADOW";
    items[8] = "MENUITEM_EXT_CLOUDSHADOW_CHOICE";
    items[9] = "MENUITEM_EXT_AMBIENTPFX";
    items[10] = "MENUITEM_EXT_AMBIENTPFX_CHOICE";
    items[11] = "MENUITEM_EXT_ENVMAP";
    items[12] = "MENUITEM_EXT_ENVMAP_CHOICE";
    items[13] = "MENUITEM_EXT_RADIALFOG";
    items[14] = "MENUITEM_EXT_RADIALFOG_CHOICE";
    items[15] = "MENUITEM_GRA_BACK";
    flags = flags | menu_show_info;
};

instance menuitem_ext_headline(c_menu_item_def) {
    text = "ERWEITERT";
    type = menu_item_text;
    posx = 0;
    posy = menu_title_y;
    dimx = 8100;
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_ext_fft(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Wasserwellen";
    text[1] = "Wellenbewegungen an/aus";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 0);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_ext_fft_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 0)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "zWaterAniEnabled";
    onchgsetoptionsection = "ENGINE";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_ext_waterfade(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Wasserfading";
    text[1] = "Wasserfading an/aus";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 1);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_ext_waterfade_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 1)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "zFarClipAlphaFade";
    onchgsetoptionsection = "ENGINE";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_ext_objwind(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Objekt Wind";
    text[1] = "Objekt Wind an/aus";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 2);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_ext_objwind_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 2)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "zWindEnabled";
    onchgsetoptionsection = "ENGINE";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_ext_cloudshadow(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Wolkenschatten";
    text[1] = "Regen-Wolkenschatten an/aus";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 3);
    dimx = 3500;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_ext_cloudshadow_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 3)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "zCloudShadowScale";
    onchgsetoptionsection = "ENGINE";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_ext_ambientpfx(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "DetailPfx";
    text[1] = "Ambientpartikel an/aus";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 4);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_ext_ambientpfx_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 4)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "zAmbientPFXEnabled";
    onchgsetoptionsection = "ENGINE";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_ext_envmap(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Glanzeffekte";
    text[1] = "Glanzeffekte an/aus";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 5);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_ext_envmap_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 5)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "zEnvMappingEnabled";
    onchgsetoptionsection = "ENGINE";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_ext_radialfog(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Radialnebel";
    text[1] = "Radialnebel an/aus";
    posx = 1000;
    posy = menu_start_y + (menu_dy * 6);
    dimx = 3000;
    dimy = 750;
    onselaction = sel_action_undef;
    flags = flags | it_effects_next;
};

instance menuitem_ext_radialfog_choice(c_menu_item_def) {
    backpic = menu_choice_back_pic;
    type = menu_item_choicebox;
    text = "nein|ja";
    fontname = menu_font_small;
    posx = 5000;
    posy = (menu_start_y + (menu_dy * 6)) + menu_choice_yplus;
    dimx = menu_slider_dx;
    dimy = menu_choice_dy;
    onchgsetoption = "zFogRadial";
    onchgsetoptionsection = "RENDERER_D3D";
    flags = flags & (~it_selectable);
    flags = flags | it_txt_center;
};

instance menuitem_ext_back(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Zurück";
    posx = 1000;
    posy = menu_back_y;
    dimx = 6192;
    dimy = menu_dy;
    onselaction = sel_action_back;
    flags = flags | it_txt_center;
};

instance menu_leave_game(c_menu_def) {
    backpic = menu_back_pic;
    items = "MENUITEM_LEAVE_GAME_HEADLINE";
    items[1] = "MENUITEM_LEAVE_GAME_YES";
    items[2] = "MENUITEM_LEAVE_GAME_NO";
    defaultoutgame = 2;
    defaultingame = 2;
    flags = flags | menu_show_info;
};

instance menuitem_leave_game_headline(c_menu_item_def) {
    text = "Das Spiel wirklich verlassen?";
    type = menu_item_text;
    posx = 0;
    posy = 3400;
    dimx = 8100;
    dimy = 750;
    flags = ((it_chromakeyed | it_transparent) | it_moveable) | it_txt_center;
};

instance menuitem_leave_game_yes(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Ja";
    text[1] = "Ja, ich möchte das Spiel beenden.";
    posx = 0;
    posy = 4400;
    dimx = 8100;
    dimy = 750;
    onselaction = sel_action_close;
    onselaction_s = "LEAVE_GAME";
    flags = (((it_chromakeyed | it_transparent) | it_moveable) | it_selectable) | it_txt_center;
};

instance menuitem_leave_game_no(c_menu_item_def) {
    backpic = menu_item_back_pic;
    text = "Nein";
    text[1] = "Nein, ich möchte weiterspielen.";
    posx = 0;
    posy = 5000;
    dimx = 8100;
    dimy = 750;
    flags = (((it_chromakeyed | it_transparent) | it_moveable) | it_selectable) | it_txt_center;
};

instance menu_savegame_load(c_menu_def) {
    backpic = menu_saveload_back_pic;
    items = "MENUITEM_LOAD_HEADLINE";
    items[1] = "MENUITEM_LOADSAVE_THUMBPIC";
    items[2] = "MENUITEM_LOADSAVE_DATETIME";
    items[3] = "MENUITEM_LOADSAVE_DATETIME_VALUE";
    items[4] = "MENUITEM_LOADSAVE_GAMETIME";
    items[5] = "MENUITEM_LOADSAVE_GAMETIME_VALUE";
    items[6] = "MENUITEM_LOADSAVE_LEVELNAME";
    items[7] = "MENUITEM_LOADSAVE_LEVELNAME_VALUE";
    items[8] = "MENUITEM_LOADSAVE_PLAYTIME_VALUE";
    items[9] = "MENUITEM_LOAD_SLOT1";
    items[10] = "MENUITEM_LOAD_SLOT2";
    items[11] = "MENUITEM_LOAD_SLOT3";
    items[12] = "MENUITEM_LOAD_SLOT4";
    items[13] = "MENUITEM_LOAD_SLOT5";
    items[14] = "MENUITEM_LOAD_SLOT6";
    items[15] = "MENUITEM_LOAD_SLOT7";
    items[16] = "MENUITEM_LOAD_SLOT8";
    items[17] = "MENUITEM_LOAD_SLOT9";
    items[18] = "MENUITEM_LOAD_SLOT10";
    items[19] = "MENUITEM_LOAD_SLOT11";
    items[20] = "MENUITEM_LOAD_SLOT12";
    items[21] = "MENUITEM_LOAD_SLOT13";
    items[22] = "MENUITEM_LOAD_SLOT14";
    items[23] = "MENUITEM_LOAD_SLOT15";
    items[24] = "MENUITEM_LOAD_SLOT16";
    items[25] = "MENUITEM_LOAD_SLOT17";
    items[26] = "MENUITEM_LOAD_SLOT18";
    items[27] = "MENUITEM_LOAD_SLOT19";
    items[28] = "MENUITEM_LOAD_SLOT20";
    items[29] = "MENUITEM_LOAD_SLOT0";
    items[30] = "MENUITEM_LOAD_BACK";
    flags = flags | menu_show_info;
};

instance menu_savegame_save(c_menu_def) {
    backpic = menu_saveload_back_pic;
    items = "MENUITEM_SAVE_HEADLINE";
    items[1] = "MENUITEM_LOADSAVE_THUMBPIC";
    items[2] = "MENUITEM_LOADSAVE_DATETIME";
    items[3] = "MENUITEM_LOADSAVE_DATETIME_VALUE";
    items[4] = "MENUITEM_LOADSAVE_GAMETIME";
    items[5] = "MENUITEM_LOADSAVE_GAMETIME_VALUE";
    items[6] = "MENUITEM_LOADSAVE_LEVELNAME";
    items[7] = "MENUITEM_LOADSAVE_LEVELNAME_VALUE";
    items[8] = "MENUITEM_LOADSAVE_PLAYTIME_VALUE";
    items[9] = "MENUITEM_SAVE_SLOT1";
    items[10] = "MENUITEM_SAVE_SLOT2";
    items[11] = "MENUITEM_SAVE_SLOT3";
    items[12] = "MENUITEM_SAVE_SLOT4";
    items[13] = "MENUITEM_SAVE_SLOT5";
    items[14] = "MENUITEM_SAVE_SLOT6";
    items[15] = "MENUITEM_SAVE_SLOT7";
    items[16] = "MENUITEM_SAVE_SLOT8";
    items[17] = "MENUITEM_SAVE_SLOT9";
    items[18] = "MENUITEM_SAVE_SLOT10";
    items[19] = "MENUITEM_SAVE_SLOT11";
    items[20] = "MENUITEM_SAVE_SLOT12";
    items[21] = "MENUITEM_SAVE_SLOT13";
    items[22] = "MENUITEM_SAVE_SLOT14";
    items[23] = "MENUITEM_SAVE_SLOT15";
    items[24] = "MENUITEM_SAVE_SLOT16";
    items[25] = "MENUITEM_SAVE_SLOT17";
    items[26] = "MENUITEM_SAVE_SLOT18";
    items[27] = "MENUITEM_SAVE_SLOT19";
    items[28] = "MENUITEM_SAVE_SLOT20";
    items[29] = "MENUITEM_SAVE_BACK";
    flags = flags | menu_show_info;
};

const int savegame_x1 = 1200;

const int savegame_x2 = 5400;

const int savegame_y = 1200;

const int savegame_dy = 275;

const int savegame_dx1 = 3500;

const int savegame_dx2 = 1000;

instance menuitem_load_headline(c_menu_item_def) {
    text = "SPIEL LADEN";
    type = menu_item_text;
    posx = savegame_x1;
    posy = 700;
    flags = it_chromakeyed | it_transparent;
    flags = flags & (~it_selectable);
};

instance menuitem_save_headline(c_menu_item_def) {
    text = "SPIEL SPEICHERN";
    type = menu_item_text;
    posx = savegame_x1;
    posy = 700;
    flags = (flags | it_chromakeyed) | it_transparent;
    flags = flags & (~it_selectable);
};

instance menuitem_loadsave_thumbpic(c_menu_item_def) {
    backpic = "";
    posx = savegame_x2;
    posy = 1350;
    dimx = 2048;
    dimy = 2048;
    flags = flags & (~it_selectable);
};

instance menuitem_loadsave_levelname(c_menu_item_def) {
    type = menu_item_text;
    text = "Welt:";
    posx = savegame_x2;
    posy = 3960;
    fontname = menu_font_small;
    flags = flags & (~it_selectable);
};

instance menuitem_loadsave_levelname_value(c_menu_item_def) {
    type = menu_item_text;
    text = "";
    posx = savegame_x2;
    posy = 3960 + 320;
    dimx = 8192 - posx;
    dimy = 350;
    fontname = menu_font_small;
    flags = flags & (~it_selectable);
};

instance menuitem_loadsave_datetime(c_menu_item_def) {
    type = menu_item_text;
    text = "gespeichert:";
    posx = savegame_x2;
    posy = 4900;
    fontname = menu_font_small;
    flags = flags & (~it_selectable);
};

instance menuitem_loadsave_datetime_value(c_menu_item_def) {
    type = menu_item_text;
    text = "";
    posx = savegame_x2;
    posy = 4900 + 320;
    dimx = 8192 - posx;
    dimy = 350;
    fontname = menu_font_small;
    flags = flags & (~it_selectable);
};

instance menuitem_loadsave_gametime(c_menu_item_def) {
    type = menu_item_text;
    text = "Spielzeit:";
    posx = savegame_x2;
    posy = 6200;
    fontname = menu_font_small;
    flags = flags & (~it_selectable);
};

instance menuitem_loadsave_gametime_value(c_menu_item_def) {
    type = menu_item_text;
    text = "";
    posx = savegame_x2;
    posy = 6200 + 320;
    dimx = 8192 - posx;
    dimy = 350;
    fontname = menu_font_small;
    flags = flags & (~it_selectable);
};

instance menuitem_loadsave_playtime_value(c_menu_item_def) {
    type = menu_item_text;
    text = "";
    posx = savegame_x2;
    posy = 6200 + (320 * 2);
    dimx = 8192 - posx;
    dimy = 350;
    fontname = menu_font_small;
    flags = flags & (~it_selectable);
};

instance menuitem_save_back(c_menu_item_def) {
    text = "Zurück";
    text[1] = "Back";
    posx = savegame_x1;
    posy = savegame_y + (21 * savegame_dy);
};

instance menuitem_load_back(c_menu_item_def) {
    text = "Zurück";
    posx = savegame_x1;
    posy = savegame_y + (21 * savegame_dy);
};

instance menuitem_save_slot1(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 1 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (0 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT1";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot2(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 2 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (1 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT2";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot3(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 3 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (2 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT3";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot4(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 4 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (3 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT4";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot5(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 5 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (4 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT5";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot6(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 6 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (5 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT6";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot7(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 7 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (6 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT7";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot8(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 8 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (7 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT8";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot9(c_menu_item_def) {
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 9 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (8 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT9";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot10(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 10 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (9 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT10";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot11(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 11 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (10 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT11";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot12(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 12 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (11 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT12";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot13(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 13 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (12 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT13";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot14(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 14 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (13 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT14";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot15(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 15 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (14 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT15";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot16(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 16 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (15 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT16";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot17(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 17 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (16 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT17";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot18(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 18 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (17 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT18";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot19(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 19 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (18 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT19";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_save_slot20(c_menu_item_def) {
    backpic = menu_input_back_pic;
    type = menu_item_input;
    text = "unknown";
    text[1] = "Slot 20 - RETURN zum Speichern in diesem Slot.";
    posx = savegame_x1;
    posy = savegame_y + (19 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_startitem;
    onselaction_s = "MENUITEM_SAVE_SLOT20";
    onselaction[1] = sel_action_close;
    onselaction_s[1] = "SAVEGAME_SAVE";
    fontname = menu_font_small;
};

instance menuitem_load_slot1(c_menu_item_def) {
    text = "unknown";
    text[1] = "Slot 1 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (0 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot2(c_menu_item_def) {
    text = "unknown";
    text[1] = "Slot 2 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (1 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot3(c_menu_item_def) {
    text = "unknown";
    text[1] = "Slot 3 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (2 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot4(c_menu_item_def) {
    text = "unknown";
    text[1] = "Slot 4 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (3 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot5(c_menu_item_def) {
    text = "unknown";
    text[1] = "Slot 5 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (4 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot6(c_menu_item_def) {
    text = "unknown";
    text[1] = "Slot 6 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (5 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot7(c_menu_item_def) {
    text = "unknown";
    text[1] = "Slot 7 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (6 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot8(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 8 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (7 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot9(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 9 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (8 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot10(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 10 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (9 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot11(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 11 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (10 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot12(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 12 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (11 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot13(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 13 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (12 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot14(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 14 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (13 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot15(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 15 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (14 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot16(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 16 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (15 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot17(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 17 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (16 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot18(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 18 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (17 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot19(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 19 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (18 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot20(c_menu_item_def) {
    text = "---";
    text[1] = "Slot 20 - RETURN zum Laden des Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (19 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
};

instance menuitem_load_slot0(c_menu_item_def) {
    text = "    - Quick Save -    ";
    text[1] = "RETURN zum Laden des gespeicherten Spielstandes.";
    posx = savegame_x1;
    posy = savegame_y + (20 * savegame_dy);
    dimx = savegame_dx1;
    dimy = savegame_dy;
    onselaction = sel_action_close;
    onselaction_s = "SAVEGAME_LOAD";
    fontname = menu_font_small;
    flags = flags;
    hideifoptionsectionset = "GAME";
    hideifoptionset = "useQuickSaveKeys";
    hideonvalue = 0;
};

instance menu_log(c_menu_def) {
    items = "MENU_ITEM_SEL_MISSIONS_ACT";
    items[1] = "MENU_ITEM_SEL_MISSIONS_OLD";
    items[2] = "MENU_ITEM_SEL_MISSIONS_FAILED";
    items[3] = "MENU_ITEM_SEL_LOG";
    items[4] = "MENU_ITEM_DAY_TITLE";
    items[5] = "MENU_ITEM_TIME_TITLE";
    items[6] = "MENU_ITEM_DAY";
    items[7] = "MENU_ITEM_TIME";
    items[8] = "MENU_ITEM_LIST_MISSIONS_ACT";
    items[9] = "MENU_ITEM_LIST_MISSIONS_FAILED";
    items[10] = "MENU_ITEM_LIST_MISSIONS_OLD";
    items[11] = "MENU_ITEM_LIST_LOG";
    items[12] = "MENU_ITEM_CONTENT_VIEWER";
    alpha = 255;
    posx = 0;
    posy = 0;
    dimx = 8191;
    dimy = 8191;
    backpic = log_back_pic;
    flags = (flags | menu_overtop) | menu_noani;
};

const int log_item_x1 = 1200;

const int log_item_dx1 = 1800;

const int log_item_list_x = 3000;

const int log_item_list_y = 1000;

const int log_item_list_height = 6100;

const int log_item_list_width = 4500;

instance menu_item_sel_missions_act(c_menu_item_def) {
    text = "Aktuelle\nMissionen";
    posx = log_item_x1;
    posy = 1500;
    dimx = log_item_dx1;
    dimy = 1000;
    fontname = log_font_default;
    flags = ((((flags | it_chromakeyed) | it_transparent) | it_selectable) | it_multiline) | it_txt_center;
    onselaction = sel_action_execcommands;
    onselaction_s = "EFFECTS MENU_ITEM_LIST_MISSIONS_ACT";
};

instance menu_item_sel_missions_old(c_menu_item_def) {
    text = "Erfüllte\nMissionen";
    posx = log_item_x1;
    posy = 2500;
    dimx = log_item_dx1;
    dimy = 1000;
    fontname = log_font_default;
    flags = ((((flags | it_chromakeyed) | it_transparent) | it_selectable) | it_multiline) | it_txt_center;
    onselaction = sel_action_execcommands;
    onselaction_s = "EFFECTS MENU_ITEM_LIST_MISSIONS_OLD";
};

instance menu_item_sel_missions_failed(c_menu_item_def) {
    text = "Gescheiterte\nMissionen";
    posx = log_item_x1;
    posy = 3500;
    dimx = log_item_dx1;
    dimy = 1000;
    fontname = log_font_default;
    flags = ((((flags | it_chromakeyed) | it_transparent) | it_selectable) | it_multiline) | it_txt_center;
    onselaction = sel_action_execcommands;
    onselaction_s = "EFFECTS MENU_ITEM_LIST_MISSIONS_FAILED";
};

instance menu_item_sel_log(c_menu_item_def) {
    text = "Allgemeine\nInfos";
    posx = log_item_x1;
    posy = 4500;
    dimx = log_item_dx1;
    dimy = 1000;
    fontname = log_font_default;
    flags = ((((flags | it_chromakeyed) | it_transparent) | it_selectable) | it_multiline) | it_txt_center;
    onselaction = sel_action_execcommands;
    onselaction_s = "EFFECTS MENU_ITEM_LIST_LOG";
};

instance menu_item_list_missions_act(c_menu_item_def) {
    type = menu_item_listbox;
    text = "Act Missions";
    posx = log_item_list_x;
    posy = log_item_list_y;
    dimx = log_item_list_width;
    dimy = log_item_list_height;
    fontname = log_font_default;
    flags = ((flags | it_chromakeyed) | it_transparent) | it_effects_next;
    flags = flags & (~it_selectable);
    flags = flags & (~it_txt_center);
    userstring = "CURRENTMISSIONS";
    framesizex = 250;
    framesizey = 0;
};

instance menu_item_list_missions_failed(c_menu_item_def) {
    type = menu_item_listbox;
    text = "Old Missions";
    posx = log_item_list_x;
    posy = log_item_list_y;
    dimx = log_item_list_width;
    dimy = log_item_list_height;
    fontname = log_font_default;
    flags = ((flags | it_chromakeyed) | it_transparent) | it_effects_next;
    flags = flags & (~it_selectable);
    flags = flags & (~it_txt_center);
    userstring = "OLDMISSIONS";
    framesizex = 250;
    framesizey = 0;
};

instance menu_item_list_missions_old(c_menu_item_def) {
    type = menu_item_listbox;
    text = "Old Missions";
    posx = log_item_list_x;
    posy = log_item_list_y;
    dimx = log_item_list_width;
    dimy = log_item_list_height;
    fontname = log_font_default;
    flags = ((flags | it_chromakeyed) | it_transparent) | it_effects_next;
    flags = flags & (~it_selectable);
    flags = flags & (~it_txt_center);
    userstring = "FAILEDMISSIONS";
    framesizex = 250;
    framesizey = 0;
};

instance menu_item_list_log(c_menu_item_def) {
    type = menu_item_listbox;
    text = "Log";
    posx = log_item_list_x;
    posy = log_item_list_y;
    dimx = log_item_list_width;
    dimy = log_item_list_height;
    fontname = log_font_default;
    flags = ((flags | it_chromakeyed) | it_transparent) | it_effects_next;
    flags = flags & (~it_selectable);
    flags = flags & (~it_txt_center);
    userstring = "LOG";
    framesizex = 250;
    framesizey = 0;
};

instance menu_item_content_viewer(c_menu_item_def) {
    text = "no content";
    posx = 0;
    posy = 0;
    dimx = 8192;
    dimy = 8192;
    fontname = log_font_viewer;
    flags = ((flags | it_chromakeyed) | it_transparent) | it_multiline;
    flags = flags & (~it_selectable);
    framesizex = 800;
    framesizey = 1000;
    backpic = log_viewer_back_pic;
};

instance menu_item_day_title(c_menu_item_def) {
    text = "Tag";
    posx = 1800;
    posy = 6000;
    fontname = log_font_datetime;
    flags = flags & (~it_selectable);
};

instance menu_item_time_title(c_menu_item_def) {
    text = "Zeit:";
    posx = 1500;
    posy = 6300;
    fontname = log_font_datetime;
    flags = flags & (~it_selectable);
};

instance menu_item_day(c_menu_item_def) {
    text = "XX.";
    posx = 1500;
    posy = 6000;
    dimx = 300;
    fontname = log_font_datetime;
    flags = flags & (~it_selectable);
};

instance menu_item_time(c_menu_item_def) {
    text = "XX:XX";
    posx = 2200;
    posy = 6300;
    fontname = log_font_datetime;
    flags = flags & (~it_selectable);
};

instance menu_status(c_menu_def) {
    items = "MENU_ITEM_HISTORY";
    alpha = 255;
    posx = 0;
    posy = 0;
    dimx = 8191;
    dimy = 8191;
    backpic = log_back_pic;
    flags = (flags | menu_overtop) | menu_noani;
};

instance menu_item_history(c_menu_item_def) {
    text = "";
    posx = 0;
    posy = 0;
    dimx = 8192;
    dimy = 8192;
    fontname = log_font_viewer;
    flags = ((flags | it_chromakeyed) | it_transparent) | it_multiline;
    flags = flags & (~it_selectable);
    framesizex = 800;
    framesizey = 1000;
    backpic = log_viewer_back_pic;
};

