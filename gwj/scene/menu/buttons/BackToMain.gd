extends "res://scene/menu/buttons/Button.gd"
func _ready():
	if get_parent().get_parent().currentmenu == 4:
		rect_position.y += 84
		$Credits.visible = true
		if Global.highestlevel == 20:
			$Credits.text += "\n\nCongratulations on beating the game!"

func _process(delta):
	if canpress and Input.is_action_just_released("mouse_left"):
		get_parent().get_parent().load_menu(0)
		Global.update_save()

