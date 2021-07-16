extends Node2D

var type = 0

func _ready():
	match type:
		0:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,15)
		1:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,16)
		2:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,17)
		3:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,18)
		4:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,19)
	generate_bg()

func generate_bg():
	$pipes.position.x = -(randi()%144)

func change_base(to):
	type = to
	match to:
		0:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,15)
		1:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,16)
		2:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,17)
		3:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,18)
		4:
			for i in 20:
				for j in 20:
					$base.set_cell(i,j,19)
