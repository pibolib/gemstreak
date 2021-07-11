extends CPUParticles2D


var time = 0
var type = 1
var clearanimtable = [
	Vector2(272,48),
	Vector2(280,48),
	Vector2(288,48)
]

func _ready():
	texture.region.position = clearanimtable[type]
	$Particles2D.texture.region.position = clearanimtable[type]
	emitting = true
	$Particles2D.emitting = true
	

func _process(delta):
	time += delta
	if time >= 10:
		queue_free()
