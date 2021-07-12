extends Node2D


var dir

# Called when the node enters the scene tree for the first time.
func _ready():
	dir = rand_range(-100,100)
	rotation_degrees = rand_range(-180,180)

func _process(delta):
	scale.x -= delta
	scale.y -= delta
	if scale.x <= 0:
		queue_free()
	rotation_degrees += dir * delta
