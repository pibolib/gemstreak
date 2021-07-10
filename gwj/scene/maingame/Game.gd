extends Node

var fallingtile = preload("res://scene/maingame/fallingtile/FallingTile.tscn")

#game variables
var score = 0

var streak = 0
var streaktime = 0

var currenttri = [0,0,0]

var garbagelevel = 0

var time = 0
var test = false

func _ready():
	for i in 6:
		for j in 8:
			$Board.set_cell(i,j+9,randi()%3)
	currenttri[0] = randi()%3
	currenttri[1] = randi()%3
	currenttri[2] = currenttri[1]
	
func _process(delta):
	time += delta
	if streaktime > 0:
		streaktime -= delta
	else:
		streak = 0
	streaktime = clamp(streaktime,0,10)
	update_info()
	process_mouse()

func update_info():
	$Info.text = "Score: "+String(score)+"\nStreak: "+String(streak)+" ("+String(streaktime)+")\nGarbage Level: "+String(garbagelevel)
	$NextDisplay.set_cell(2,4,currenttri[0])
	$NextDisplay.set_cell(1,5,currenttri[1])
	$NextDisplay.set_cell(2,5,currenttri[2])
func update_board():
	pass

func check_for_line(row):
	var color = $Board.get_cell(0,row)
	var canclear = true
	for i in 6:
		if $Board.get_cell(i,row) != color:
			canclear = false
	if color == -1 or color == 3:
		canclear = false
	if canclear:
		for i in 6:
			$Board.set_cell(i,row,-1)
			if $Board.get_cell(i,row-1) == 3:
				$Board.set_cell(i,row-1,-1)
				score += 10
			if $Board.get_cell(i,row+1) == 3:
				$Board.set_cell(i,row+1,-1)
				score += 10
		score += 100 + streak*10
		streak += 1
		streaktime = 10
		check_for_falling(row)

func check_for_falling(row):
	for i in 6:
		for j in row:
			if $Board.get_cell(i,j) != -1:
				if $Board.get_cell(i-1,i+1) == -1 or $Board.get_cell(i,i+1) == -1:
					$Board.set_cell(i,j,-1)
					var mytile = fallingtile.instance()
					mytile.position.x = 16*i
					if j%2 == 1:
						mytile.position.x += 8
					mytile.position.y = 8*j
					$Board.add_child(mytile)

func process_mouse():
	if Input.is_action_just_released("mouse_up"):
		var save = currenttri[0]
		currenttri[0] = currenttri[2]
		currenttri[2] = currenttri[1]
		currenttri[1] = save
	if Input.is_action_just_released("mouse_down"):
		var save = currenttri[2]
		currenttri[2] = currenttri[0]
		currenttri[0] = currenttri[1]
		currenttri[1] = save
	if Input.is_action_just_released("mouse_right"):
		currenttri[0] = randi()%3
		currenttri[1] = randi()%3
		currenttri[2] = currenttri[1]
		garbagelevel += 1
		garbagelevel = clamp(garbagelevel,0,12)
