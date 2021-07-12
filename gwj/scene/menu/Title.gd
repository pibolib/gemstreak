extends Node2D

var time = 0

func _ready():
	Global.currenttrack = 2

func _process(delta):
	time += delta
	if Input.is_action_just_released("mouse_left"):
		Global.toscene = "res://scene/maingame/Game.tscn"
	if Input.is_action_just_released("mouse_right"):
		if Global.showtutorial:
			Global.showtutorial = false
		else:
			Global.showtutorial = true
	if !Global.showtutorial:
		$Label5.visible = false
		$Label3.text = "<LEFT CLICK TO PLAY>"
	else:
		$Label5.visible = true
		$Label3.text = "<LEFT CLICK TO PLAY>\n<RIGHT CLICK TO HIDE TUTORIAL>"
