extends Node2D

func _ready():
	generate_bg()

func generate_bg():
	$pipes.position.x = -(randi()%144)
