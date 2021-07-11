extends Node2D

var lineclearanim2 = preload("res://scene/maingame/clearanims/LineClearAnim2.tscn")
var time = 0
var type = 0
var spritetable = [
	Vector2(208,0),
	Vector2(208,16),
	Vector2(208,32)
]

func _ready():
	$Sprite.region_rect.position = spritetable[type]
	var myclearanim = lineclearanim2.instance()
	myclearanim.position = position
	myclearanim.type = type
	get_parent().add_child(myclearanim)
func _process(delta):
	time += delta
	$Sprite.scale.x = lerp(1,1.5,time*3)
	$Sprite.scale.y = lerp(1,0,time*3)
	$Sprite.self_modulate.a = lerp(1,0,time*3)
	if time >= 0.33:
		queue_free()
