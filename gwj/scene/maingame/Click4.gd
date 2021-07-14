extends Area2D


var canrotate = false

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if canrotate and Input.is_action_just_released("mouse_left") and !get_owner().gameover and !get_owner().pause:
		var save = get_parent().get_parent().currenttri[2]
		get_parent().get_parent().currenttri[2] = get_parent().get_parent().currenttri[0]
		get_parent().get_parent().currenttri[0] = get_parent().get_parent().currenttri[1]
		get_parent().get_parent().currenttri[1] = save
		get_parent().get_parent().get_node("Audio/Rotate").playing = true
	if canrotate and Input.is_action_pressed("mouse_left") and !get_owner().gameover and !get_owner().pause:
		get_parent().region_rect.position = Vector2(128,112)
	else:
		get_parent().region_rect.position = Vector2(128,96)

func _on_Click2_mouse_entered():
	canrotate = true

func _on_Click2_mouse_exited():
	canrotate = false
