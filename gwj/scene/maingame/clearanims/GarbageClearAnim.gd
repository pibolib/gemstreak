extends Node2D


var time = 0
	
func _process(delta):
	time += delta
	$Sprite.scale.x = lerp(1,2,time)
	$Sprite.scale.y = lerp(1,2,time)
	$Sprite.self_modulate.a = lerp(1,0,time)
	$Sprite.rotation_degrees = time*60
	if time >= 1:
		queue_free()
