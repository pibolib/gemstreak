extends Area2D

var canpause = false

func _process(_delta):
	if canpause and Input.is_action_just_released("mouse_left") and !get_owner().gameover:
		if get_owner().pause:
			get_owner().pause = false
		else:
			get_owner().pause = true
func _on_Click_mouse_entered():
	canpause = true

func _on_Click_mouse_exited():
	canpause = false
