extends "res://scene/menu/buttons/Button.gd"

var level = 0

func _ready():
	$Label.text = String(21-level)+"th Century"
	if level == 18:
		$Label.text = String(21-level)+"rd Century"
	elif level == 19:
		$Label.text = String(21-level)+"nd Century"
	elif level == 20:
		$Label.text = String(21-level)+"st Century"

func _process(delta):
	if Global.highestlevel < level-1:
		condition = false
	if canpress and Input.is_action_just_released("mouse_left") and condition:
		Global.level = level
		match level:
			1:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 2
			2:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 4
			3:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 6
			4:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 8
			5:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 10
			6:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 12
			7:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 14
			8:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 16
			9:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 18
			10:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 20
			11:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 22
			12:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 24
			13:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 26
			14:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 28
			15:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 30
			16:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 32
			17:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 34
			18:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 36
			19:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 38
			20:
				Global.toscene = "res://scene/dialogue/Dialogue.tscn"
				Global.dialogue = 40
			_:
				Global.toscene = "res://scene/maingame/Game.tscn"
