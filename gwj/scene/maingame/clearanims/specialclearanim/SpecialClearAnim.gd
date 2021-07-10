extends Node2D


var time = 0
var type = 0
var spritetable = [
	Vector2(224,48),
	Vector2(240,48),
	Vector2(256,48)
]

func _ready():
	$Sprite.region_rect.position = spritetable[type]
	
func _process(delta):
	time += delta
	$Sprite.scale.x = lerp(1,2,time)
	$Sprite.scale.y = lerp(1,2,time)
	$Sprite.self_modulate.a = lerp(1,0,time)
	if time >= 1:
		queue_free()
