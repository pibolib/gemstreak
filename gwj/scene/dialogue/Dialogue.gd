extends Node

var dialogue = [
	"LEFT CLICK TO PROCEED, RIGHT CLICK TO SKIP.",
	"OLD MAN: This is test dialogue.",
	"Yes, I'm speaking to you, the player behind that screen.",
	"I'm trying to tell you that this is test dialogue, but it doesn't seem like you want to listen.",
	"..."
]
var currentline = 0
var charvis = 0

func _ready():
	pass
func _process(delta):
	$CanvasLayer/Text.text = ""
	for i in currentline+1:
		$CanvasLayer/Text.text += dialogue[i]+"\n"
	$CanvasLayer/Text.visible_characters = charvis
	if charvis >= $CanvasLayer/Text.text.length()-1:
		if Input.is_action_just_released("mouse_left"):
			currentline += 1
			if currentline == dialogue.size():
				currentline = dialogue.size()-1
	else:
		charvis += 30*delta
		if Input.is_action_just_released("mouse_left"):
			charvis = $CanvasLayer/Text.text.length()
