extends Node

var fallingtile = preload("res://scene/maingame/fallingtile/FallingTile.tscn")
var lineclearanim = preload("res://scene/maingame/clearanims/LineClearAnim.tscn")
var garbageclearanim = preload("res://scene/maingame/clearanims/GarbageClearAnim.tscn")

#game variables
var score = 0

var streak = 0
var streaktime = 0

var lastcolor = -1
var colorstreak = 0
var colorstreaktable = [
	Vector2(208,64),
	Vector2(235,64),
	Vector2(262,64)
]

var currenttri = [0,0,0]
var nexttri = [0,0,0]
var currenttick = 0

var garbagelevel = 0

var time = 0
var test = false

var mousetilepos = Vector2(0,0)
var mposcenter = Vector2(0,0)

var falltimer = 0.125

var currentgarbage = 0

func _ready():
	for i in 6:
		for j in 8:
			$Board.set_cell(i,j+9,randi()%3)
	currenttri = generate_pieces()
	nexttri = generate_pieces()
func _process(delta):
	falltimer -= delta
	if falltimer <= 0:
		falltimer = 0.0625
		check_for_falling(currenttick)
		currenttick += 1
		if currenttick == 17:
			currenttick = -2
	time += delta
	if streaktime > 0:
		streaktime -= delta
	else:
		streak = 0
	streaktime = clamp(streaktime,0,10)
	garbagelevel = clamp(garbagelevel,0,6)
	update_info()
	process_mouse()

func update_info():
	$Info.text = "Score: "+String(score)+"\nStreak: "+String(streak)+" ("+String(streaktime)+")\nColor Streak: "+String(colorstreak)+"\nGarbage Level: "+String(garbagelevel)+"\nMouse Position: "+String(mousetilepos)
	$NextDisplay.set_cell(2,4,currenttri[0])
	$NextDisplay.set_cell(1,5,currenttri[1])
	$NextDisplay.set_cell(2,5,currenttri[2])
	
	$NextDisplay.set_cell(2,8,nexttri[0])
	$NextDisplay.set_cell(1,9,nexttri[1])
	$NextDisplay.set_cell(2,9,nexttri[2])
	$UI/Score.text = String(score).pad_zeros(5)
	if lastcolor != -1:
		$Streak.region_rect.position = colorstreaktable[lastcolor]
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
				var myanim = garbageclearanim.instance()
				myanim.position = $Board.map_to_world(Vector2(i,row-1)) + Vector2(8,8)
				$Board.add_child(myanim)
				score += 10
			if $Board.get_cell(i,row+1) == 3:
				$Board.set_cell(i,row+1,-1)
				var myanim = garbageclearanim.instance()
				myanim.position = $Board.map_to_world(Vector2(i,row+1)) + Vector2(8,8)
				$Board.add_child(myanim)
				score += 10
		score += 100 + streak*10
		streak += 1
		if color == lastcolor:
			colorstreak += 1
			score += 25*colorstreak
		else:
			colorstreak = 0
			lastcolor = color
		streaktime = 10
		garbagelevel -= 1
		var myanim = lineclearanim.instance()
		myanim.type = color
		myanim.position.x = 48
		if row%2 == 1:
			myanim.position.x += 8
		myanim.position.y = 8*row+8
		$Board.add_child(myanim)
	for i in 6:
		for j in 17:
			if $Board.get_cell(i,16-j+1) == -1:
				$Board.set_cell(i,16-j+1,$Board.get_cell(i,16-j))
				$Board.set_cell(i,16-j,-1)
func check_for_falling(row):
	for i in 6:
		for j in row:
			if $Board.get_cell(i,j) != -1:
				if $Board.get_cell(i,j+1) == -1:
					$Board.set_cell(i,j+1,$Board.get_cell(i,j))
					$Board.set_cell(i,j,-1)
				else:
					if j%2 == 0:
						if $Board.get_cell(i-1,j+1) == -1:
							$Board.set_cell(i-1,j+1,$Board.get_cell(i,j))
							$Board.set_cell(i,j,-1)
					else:
						if $Board.get_cell(i+1,j+1) == -1:
							$Board.set_cell(i+1,j+1,$Board.get_cell(i,j))
							$Board.set_cell(i,j,-1)
func process_mouse():
	$BoardPreview.clear()
	mposcenter = get_viewport().get_mouse_position()
	mposcenter.x = int(clamp(mposcenter.x,75,181)) - 75
	mposcenter.y = int(clamp(mposcenter.y,24,169)) - 28
	mousetilepos = $BoardPreview.world_to_map(mposcenter)
	mousetilepos.x = clamp(mousetilepos.x,0,5)
	mousetilepos.y = clamp(mousetilepos.y,0,16)
	$BoardPreview.set_cell(mousetilepos.x,mousetilepos.y,5)
	var canplace = true
	if int(mousetilepos.y)%2 == 0:
		if $Board.get_cell(mousetilepos.x-1,mousetilepos.y+1) != 4:
			$BoardPreview.set_cell(mousetilepos.x-1,mousetilepos.y+1,5)
		else:
			$BoardPreview.set_cell(mousetilepos.x-1,mousetilepos.y+1,6)
			canplace = false
		if $Board.get_cell(mousetilepos.x,mousetilepos.y+1) != 4:
			$BoardPreview.set_cell(mousetilepos.x,mousetilepos.y+1,5)
		else:
			$BoardPreview.set_cell(mousetilepos.x,mousetilepos.y+1,6)
			canplace = false
	else:
		if $Board.get_cell(mousetilepos.x+1,mousetilepos.y+1) != 4:
			$BoardPreview.set_cell(mousetilepos.x+1,mousetilepos.y+1,5)
		else:
			$BoardPreview.set_cell(mousetilepos.x+1,mousetilepos.y+1,6)
			canplace = false
		if $Board.get_cell(mousetilepos.x,mousetilepos.y+1) != 4:
			$BoardPreview.set_cell(mousetilepos.x,mousetilepos.y+1,5)
		else:
			$BoardPreview.set_cell(mousetilepos.x,mousetilepos.y+1,6)
			canplace = false
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
		for i in 3:
			currenttri[i] = nexttri[i]
		nexttri = generate_pieces()
		garbagelevel += 1
		for i in garbagelevel:
			$Board.set_cell(currentgarbage,0,3)
			currentgarbage += 1
			currentgarbage = currentgarbage % 6
	if Input.is_action_just_released("mouse_left"):
		if canplace:
			var tnum = 0
			for tile in $BoardPreview.get_used_cells():
				if $Board.get_cell(tile.x,tile.y) != -1:
					var mytile = fallingtile.instance()
					mytile.position = $Board.map_to_world(tile)
					mytile.type = $Board.get_cell(tile.x,tile.y)
					$Board.add_child(mytile)
				$Board.set_cell(tile.x,tile.y,currenttri[tnum])
				tnum += 1
			for i in 3:
				currenttri[i] = nexttri[i]
			nexttri = generate_pieces()
			for i in 17:
				check_for_line(i)
func generate_pieces():
	var array = [randi()%3,randi()%3,randi()%3]
	return array
