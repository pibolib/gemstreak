extends Node

var dialogue = [
	"LEFT CLICK TO PROCEED. RIGHT CLICK TO SKIP.\n\nYOU FIND A STRANGE MACHINE IN THE WOODS. IT IS CONSTRUCTED FROM AN OTHERWORLDLY MATERIAL THE LIKES OF WHICH YOU HAVE NEVER SEEN. ITS EDGES GLOW WITH A FAINT BLUE, AND THE WALLS HAVE THE COLOR OF CLAY. A VOICE COMES FROM WITHIN.\n\n???: Who are you? Why have you come here?\n",
	"A CALM BREEZE FLOWS FROM THE MYSTERIOUS MACHINE.\nYOU BEGIN TO HEAR FOOTSTEPS FOLLOWING THE BREEZE.\nA GREY-HAIRED, BEARDED MAN WALKS TOWARDS YOU.\n\nOLD MAN: I beg of you, do not come in.\n\nA VOICE ENTERS YOUR BRAIN, COMMANDING YOU TO ENTER.\nDREAD FILLS YOUR BODY, AND 'YOU' COMMAND YOUR BODY TO ENTER THE MACHINE.\nTHE OLD MAN'S EXPRESSION DEGRADES.\nTHE MACHINE'S DOOR SHUTS CLOSED WITH A CLICK.\n\nOLD MAN: I am so sorry, my child, but I must welcome you to this here time machine, for it may be a while until we are set free from its curse.\n\nTHE POWER TO TRAVEL THROUGH TIME, A PIECE OF TECHNOLOGY WHICH WAS BELIEVED TO BE LOST TO TIME ITSELF HAS BEEN ONCE AGAIN UNCOVERED."
]
var currentline = 0
var charvis = 0

func _ready():
	pass
func _process(delta):
	$CanvasLayer/Text.visible_characters = charvis
	$CanvasLayer/Text.text = dialogue[currentline]
	charvis += 50*delta
	if Input.is_action_just_released("mouse_left"):
		if charvis < $CanvasLayer/Text.text.length():
			charvis = $CanvasLayer/Text.text.length()
		elif currentline < dialogue.size()-1:
			currentline += 1
			charvis = 0
