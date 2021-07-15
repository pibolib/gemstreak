extends "res://scene/menu/buttons/Button.gd"

func _process(delta):
	$Label.text = "SFX: "+String(Global.sfxvol*10)+"%"
