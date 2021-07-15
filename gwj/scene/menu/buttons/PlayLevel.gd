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
		Global.toscene = "res://scene/maingame/Game.tscn"
