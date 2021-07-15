extends "res://scene/menu/buttons/Button.gd"

func _process(delta):
	if Global.highestlevel < 4:
		condition = false
		$Description.text = "Locked until Story Part 1 is completed."
	if canpress and Input.is_action_just_released("mouse_left") and condition:
		get_parent().get_parent().load_story_menu(1)

