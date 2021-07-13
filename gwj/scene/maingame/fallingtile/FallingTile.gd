extends Node2D

const G = 900
var type = 0
var poslastframe = Vector2(0,0)
var motion = Vector2(0,-550)
var gravity = Vector2(0,G)
var spritetable = [
	Vector2(0,0),
	Vector2(16,0),
	Vector2(32,0),
	Vector2(48,0)
]
var settletime = 0
var tilepos = Vector2(int(0),int(0))
var killcheck = false

func _ready():
	if type == -1:
		queue_free()
	else:
		$Sprite.region_rect.position = spritetable[type]
	calculate_tilepos()
func _process(delta):
	if !get_parent().get_parent().pause:
		motion += gravity * delta
		position += motion * delta
		calculate_tilepos()
		if get_parent().get_cell(tilepos.x,tilepos.y+2) != -1 and motion.y > 0 and tilepos.y >= 0:
			if get_parent().get_cell(tilepos.x,tilepos.y) == -1:
				get_parent().set_cell(tilepos.x,tilepos.y,type)
				get_parent().get_parent().check_for_line(tilepos.y)
				queue_free()
			elif get_parent().get_cell(tilepos.x-1,tilepos.y) == -1:
				get_parent().set_cell(tilepos.x-1,tilepos.y,type)
				get_parent().get_parent().check_for_line(tilepos.y)
				queue_free()
			elif get_parent().get_cell(tilepos.x+1,tilepos.y) == -1:
				get_parent().set_cell(tilepos.x+1,tilepos.y,type)
				get_parent().get_parent().check_for_line(tilepos.y)
				queue_free()
		if position.y > 200:
			get_parent().get_parent().life = 0
			queue_free()
func calculate_tilepos():
	tilepos = get_parent().world_to_map(Vector2(position.x,position.y))
	tilepos.x = clamp(tilepos.x,0,3000)
	tilepos.y = clamp(tilepos.y,0,3000)
