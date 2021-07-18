extends "res://scene/dialogue/Text.gd"

var dialogue = [
	"LEFT CLICK TO PROCEED. RIGHT CLICK TO SKIP.\n\nYOU FIND A STRANGE MACHINE IN THE WOODS. IT IS CONSTRUCTED FROM AN OTHERWORLDLY MATERIAL THE LIKES OF WHICH YOU HAVE NEVER SEEN. ITS EDGES GLOW WITH A FAINT BLUE, AND THE WALLS HAVE THE COLOR OF CLAY. A VOICE COMES FROM WITHIN.\n\n???: Who are you? Why have you come here?\n",
	"A CALM BREEZE FLOWS FROM THE MYSTERIOUS MACHINE.\nYOU BEGIN TO HEAR FOOTSTEPS FOLLOWING THE BREEZE.\nA GREY-HAIRED, BEARDED MAN WALKS TOWARDS YOU.\n\nOLD MAN: I beg of you, do not come in.\n\nA VOICE ENTERS YOUR BRAIN, COMMANDING YOU TO ENTER.\nDREAD FILLS YOUR BODY, AND 'YOU' COMMAND YOUR BODY TO ENTER THE MACHINE.\nTHE OLD MAN'S EXPRESSION DEGRADES.\nTHE MACHINE'S DOOR SHUTS CLOSED WITH A CLICK.\n\nOLD MAN: I am so sorry, my child, but I must welcome you to this here time machine, for it may be a while until we are set free from its curse.\n\n",
	"YOU LOOK AROUND THE INSIDES OF THE MACHINE. \nIT APPEARS TO COME FROM SEVERAL PERIODS IN TIME, SOMEHOW CONSTRUCTED IN A WAY THAT MAKES IT LOOK LIKE IT WAS MADE 2000 YEARS AGO AND 2000 YEARS IN THE FUTURE.\n\nIT SEEMS THAT THE OLD MAN IS RIGHT, IT MAY BE A WHILE UNTIL YOU'RE FREE."
]
var afterdialogue = "res://scene/menu/Title.tscn"
var currentline = 0
var charvis = 0

func _ready():
	Global.currenttrack = 2
	load_dialogue(Global.dialogue)
	
func _process(delta):
	$CanvasLayer/Text.visible_characters = charvis
	$CanvasLayer/Text.text = dialogue[currentline]
	charvis += 50*delta
	if Input.is_action_just_released("mouse_left"):
		if charvis < $CanvasLayer/Text.text.length():
			charvis = 100000
		else:
			if currentline < dialogue.size()-1:
				currentline += 1
				charvis = 0
			else:
				Global.toscene = afterdialogue
	if Input.is_action_just_released("mouse_right"):
		Global.toscene = afterdialogue
func load_dialogue(id):
	match id:
		0:
			dialogue = prologue
			afterdialogue = "res://scene/menu/Title.tscn"
		1:
			dialogue = tutorial
			afterdialogue = "res://scene/maingame/Game.tscn"
		2:  
			dialogue = level1before
			afterdialogue = "res://scene/maingame/Game.tscn"
		3:
			dialogue = level1after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		4:
			dialogue = level2before
			afterdialogue = "res://scene/maingame/Game.tscn"
		5:
			dialogue = level2after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		6:
			dialogue = level3before
			afterdialogue = "res://scene/maingame/Game.tscn"
		7:
			dialogue = level3after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		8:
			dialogue = level4before
			afterdialogue = "res://scene/maingame/Game.tscn"
		9:
			dialogue = level4after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		10:
			dialogue = level5before
			afterdialogue = "res://scene/maingame/Game.tscn"
		11:
			dialogue = level5after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		12:
			dialogue = level6before
			afterdialogue = "res://scene/maingame/Game.tscn"
		13:
			dialogue = level6after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		14:
			dialogue = level7before
			afterdialogue = "res://scene/maingame/Game.tscn"
		15:
			dialogue = level7after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		16:
			dialogue = level8before
			afterdialogue = "res://scene/maingame/Game.tscn"
		17:
			dialogue = level8after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		18:  
			dialogue = level9before
			afterdialogue = "res://scene/maingame/Game.tscn"
		19:
			dialogue = level9after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		20:
			dialogue = level10before
			afterdialogue = "res://scene/maingame/Game.tscn"
		21:
			dialogue = level10after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		22:
			dialogue = level11before
			afterdialogue = "res://scene/maingame/Game.tscn"
		23:
			dialogue = level11after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		24:
			dialogue = level12before
			afterdialogue = "res://scene/maingame/Game.tscn"
		25:
			dialogue = level12after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		26:
			dialogue = level13before
			afterdialogue = "res://scene/maingame/Game.tscn"
		27:
			dialogue = level13after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		28:
			dialogue = level14before
			afterdialogue = "res://scene/maingame/Game.tscn"
		29:
			dialogue = level14after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		30:
			dialogue = level15before
			afterdialogue = "res://scene/maingame/Game.tscn"
		31:
			dialogue = level15after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		32:
			dialogue = level16before
			afterdialogue = "res://scene/maingame/Game.tscn"
		33:
			dialogue = level16after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		34:
			dialogue = level17before
			afterdialogue = "res://scene/maingame/Game.tscn"
		35:
			dialogue = level17after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		36:
			dialogue = level18before
			afterdialogue = "res://scene/maingame/Game.tscn"
		37:
			dialogue = level18after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		38:
			dialogue = level19before
			afterdialogue = "res://scene/maingame/Game.tscn"
		39:
			dialogue = level19after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 1
		40:
			dialogue = level20before
			afterdialogue = "res://scene/maingame/Game.tscn"
		41:
			Global.currenttrack = 6
			dialogue = level20after
			afterdialogue = "res://scene/menu/Title.tscn"
			Global.preloadmenu = 4
