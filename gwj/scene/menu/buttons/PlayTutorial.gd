extends "res://scene/menu/buttons/Button.gd"

func _process(delta):
	if canpress and Input.is_action_just_released("mouse_left"):
		Global.toscene = "res://scene/dialogue/Dialogue.tscn"
		Global.dialogue = 1
		Global.level = 0


