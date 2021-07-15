extends "res://scene/menu/buttons/Button.gd"

func _process(delta):
	$Label.text = "BGM: "+String(Global.bgmvol*10)+"%"
