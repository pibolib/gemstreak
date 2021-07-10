extends KinematicBody2D

const G = 6
var type = 0
var poslastframe = Vector2(0,0)
var motion = Vector2(0,1)
var gravity = Vector2(0,G)
var spritetable = [
	Vector2(0,0),
	Vector2(16,0),
	Vector2(32,0),
	Vector2(48,0)
]
var settletime = 0
var tilepos = Vector2(int(0),int(0))

func _ready():
	if type == -1:
		queue_free()
	else:
		$Sprite.region_rect.position = spritetable[type]
	calculate_tilepos()
	#print(tilepos)

func _physics_process(delta):
	calculate_tilepos()
	motion += gravity
	motion = move_and_slide(motion,Vector2(0,-1),false,4,0.785398,false)
	if abs(position.x-poslastframe.x) < 1 and abs(position.y-poslastframe.y) < 1:
		settletime += delta
	else:
		settletime = 0
	if settletime >= 0.75:
		calculate_tilepos()
		get_parent().set_cell(tilepos.x,tilepos.y,type)
		get_parent().get_parent().check_for_line(tilepos.y)
		get_parent().get_parent().check_for_falling(tilepos.y)
		print("h at "+String(tilepos))
		queue_free()
	poslastframe = position
func calculate_tilepos():
	var intpos = [int(position.x),int(position.y)]
	if intpos[1] % 16 < 8:
		tilepos.x = intpos[0]/16
	else:
		tilepos.x = int(intpos[0]/16)
	tilepos.y = intpos[1]/8
