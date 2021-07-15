extends "res://scene/menu/buttons/Button.gd"

func _process(delta):
	if Global.highestlevel < 4:
		condition = false
		$Description.text = "Locked until Story Part 1 is completed."
	else:
		$Description.text = "Play an endless run. High Score: "+String(Global.highscore)
	if canpress and Input.is_action_just_released("mouse_left") and condition:
		Global.toscene = "res://scene/maingame/Game.tscn"
		Global.level = 21

