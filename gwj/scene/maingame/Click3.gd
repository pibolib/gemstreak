extends Area2D

var text = preload("res://scene/maingame/textpopup/Text.tscn")
var cantrash = false

# Called when the node enters the scene tree for the first time.
func _process(delta):
	if cantrash and Input.is_action_just_released("mouse_left") and !get_owner().gameover and !get_owner().pause:
		for i in 3:
			get_owner().currenttri[i] = get_owner().nexttri[i]
		get_owner().piecenum += 1
		get_owner().nexttri = get_owner().generate_pieces()
		get_owner().get_node("Audio/Discard").pitch_scale = rand_range(0.9,1.1)
		get_owner().get_node("Audio/Discard").playing = true
		get_owner().garbagelevel += 1
		for i in get_owner().garbagelevel:
			get_owner().get_node("Board").set_cell(get_owner().currentgarbage,0,3)
			get_owner().currentgarbage += 1
			get_owner().currentgarbage = get_owner().currentgarbage % 6
		if get_owner().garbagelevel > 3:
			var mytext2 = text.instance()
			mytext2.position = Vector2(128,16)
			mytext2.text = "GARBAGE WARNING!!"
			mytext2.special = true
			get_owner().add_child(mytext2)
	if cantrash and Input.is_action_pressed("mouse_left") and !get_owner().gameover and !get_owner().pause:
		get_parent().region_rect.position = Vector2(112,112)
	else:
		get_parent().region_rect.position = Vector2(112,96)

func _on_Click2_mouse_entered():
	cantrash = true

func _on_Click2_mouse_exited():
	cantrash = false
