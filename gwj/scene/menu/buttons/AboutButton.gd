extends "res://scene/menu/buttons/Button.gd"

func _process(delta):
	if canpress and Input.is_action_just_released("mouse_left"):
		get_parent().get_parent().load_menu(4)
