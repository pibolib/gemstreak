extends Node2D


var motion = Vector2(0,-30)
var text = ""
var time = 0
var special = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = text

func _process(delta):
	time += delta
	if !special:
		position += motion * delta
		if time > 1.2:
			queue_free()
	else:
		if time > 2.4:
			queue_free()
