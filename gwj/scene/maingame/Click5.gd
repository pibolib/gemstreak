extends Area2D


var canrotate = false

# Called when the node enters the scene tree for the first time.
func _process(delta):
	get_parent().visible = get_owner().pause
	if canrotate and Input.is_action_just_released("mouse_left"):
		Global.toscene = "res://scene/menu/Title.tscn"
	if canrotate and Input.is_action_pressed("mouse_left"):
		get_parent().region_rect.position = Vector2(64,112)
	else:
		get_parent().region_rect.position = Vector2(64,96)

func _on_Click_mouse_entered():
	canrotate = true

func _on_Click_mouse_exited():
	canrotate = false
