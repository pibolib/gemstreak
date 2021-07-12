extends Node

var fallingtile = preload("res://scene/maingame/fallingtile/FallingTile.tscn")
var lineclearanim = preload("res://scene/maingame/clearanims/LineClearAnim.tscn")
var garbageclearanim = preload("res://scene/maingame/clearanims/GarbageClearAnim.tscn")
var specialclearanim = preload("res://scene/maingame/clearanims/specialclearanim/SpecialClearAnim.tscn")
var text = preload("res://scene/maingame/textpopup/Text.tscn")
var shinything = preload("res://scene/maingame/etc/ShinyThing.tscn")
var bg01 = preload("res://scene/maingame/backgrounds/bg01/bg01.tscn")
var bg02 = preload("res://scene/maingame/backgrounds/bg02/bg02.tscn")

#game variables
var score = 0
var dscore = 0
var scrtick = 0
var scoregoal = 1000

var line = 0
var streak = 0
var streaktime = 0

var lastcolor = -1
var colorstreak = 0
var colorstreakbonus = false
var colorstreaktable = [
	Vector2(208,64),
	Vector2(235,64),
	Vector2(262,64)
]

var piecenum = 1
var currenttri = [0,0,0]
var nexttri = [0,0,0]
var currenttick = 0

var garbagelevel = 0

var time = 0
var test = false

var life = 120
var gameover = false

var mousetilepos = Vector2(0,0)
var mposcenter = Vector2(0,0)

var falltimer = 0.125

var currentgarbage = 0
var nextshine = 0.5

var bgm = 0
func _ready():
	var bg = bg01.instance()
	add_child(bg)
	bgm = 1+2*(randi()%2)
	for i in 6:
		for j in 8:
			$Board.set_cell(i,j+9,randi()%3)
	currenttri = generate_pieces()
	nexttri = generate_pieces()
func _process(delta):
	if score > Global.highscore:
		Global.highscore = score
	if gameover:
		$UI/Lose.visible = true
	if Global.transitiontime <= 0:
		Global.currenttrack = bgm
	nextshine -= delta
	if nextshine <= 0:
		var randpos = Vector2(randi()%6,randi()%20)
		var randcell = $Board.get_cell(randpos.x,randpos.y)
		match randcell:
			0,1,2:
				var myshine = shinything.instance()
				myshine.position = $Board.map_to_world(randpos)+Vector2(11,2)
				$Board.add_child(myshine)
		nextshine = rand_range(0.4,0.6)
	if life == 0:
		for i in 6:
			for j in 20:
				var tile = $Board.get_cell(i,j-2)
				if tile != -1 and tile != 8 and tile != 4:
					$Board.set_cell(i,j-2,8)
		if !gameover:
			$Audio/GameOver.playing = true
		gameover = true
	scrtick -= delta
	if scrtick <= 0:
		update_board()
		scrtick = 0.0625
		if score-dscore > 101:
			dscore += 100
		elif score-dscore > 11:
			dscore += 10
		elif score > dscore:
			dscore += 1
	if colorstreak >= 5 and !colorstreakbonus:
		score += 1000
		life += 15
		$Audio/ColorBonus.playing = true
		var mytext2 = text.instance()
		mytext2.position = Vector2(128,16)
		mytext2.text = "CONSECUTIVE COLOR BONUS +1000"
		mytext2.special = true
		add_child(mytext2)
		for i in 6:
			for j in 20:
				if $Board.get_cell(i,j) == lastcolor:
					$Board.set_cell(i,j,-1)
					score += 20
					var mytext = text.instance()
					mytext.position = $Board.map_to_world(Vector2(i,j)) + Vector2(8,8)
					mytext.text = "+20"
					$Board.add_child(mytext)
					var myanim = specialclearanim.instance()
					myanim.position = $Board.map_to_world(Vector2(i,j)) + Vector2(8,8)
					myanim.type = lastcolor
					$Board.add_child(myanim)
				if $Board.get_cell(i,j) == 3:
					$Board.set_cell(i,j,-1)
					score += 5
					var mytext = text.instance()
					mytext.position = $Board.map_to_world(Vector2(i,j)) + Vector2(8,8)
					mytext.text = "+5"
					$Board.add_child(mytext)
					var myanim = garbageclearanim.instance()
					myanim.position = $Board.map_to_world(Vector2(i,j)) + Vector2(8,8)
					$Board.add_child(myanim)
		colorstreakbonus = true
		for i in 17:
			check_for_line(i)
	life -= delta
	falltimer -= delta
	if falltimer <= 0:
		falltimer = 0.25
		check_for_falling(-1)
		check_for_falling(-2)
		for i in 22:
			check_for_falling(17-i)
	time += delta
	if !gameover:
		if streaktime > 0:
			streaktime -= delta
		else:
			streak = 0
	streaktime = clamp(streaktime,0,10)
	garbagelevel = clamp(garbagelevel,0,6)
	life = clamp(life,0,180)
	update_info()
	process_mouse()

func update_info():
	$Info.text = "Streak: "+String(streak)+" ("+String(streaktime)+")\nGarbage Level: "+String(garbagelevel)
	$NextDisplay.set_cell(2,4,currenttri[0])
	$NextDisplay.set_cell(1,5,currenttri[1])
	$NextDisplay.set_cell(2,5,currenttri[2])
	
	$NextDisplay.set_cell(2,8,nexttri[0])
	$NextDisplay.set_cell(1,9,nexttri[1])
	$NextDisplay.set_cell(2,9,nexttri[2])
	$UI/Score.text = String(dscore).pad_zeros(5)+"\n"+String(Global.highscore).pad_zeros(5)
	if lastcolor != -1:
		$Streak.region_rect.position = colorstreaktable[lastcolor]
	$UI/ColorStreak.text = String(colorstreak)
	$UI/Time.text = String(int(life/60))+":"+String(int(life)%60).pad_zeros(2)
	$UI/Streak.text = String(streak)
	$Streak3.offset.y = floor(60*((10-streaktime)/10))+1
	$Streak3.region_rect.size.y = floor(60*(streaktime/10))
	$UI/LineCount.text = String(line)
func update_board():
	$BoardConnections.clear()
	for i in 6:
		for j in 20:
			if $Board.get_cell(i,j) == $Board.get_cell(i+1,j):
				$BoardConnections.set_cell(i,j,$Board.get_cell(i,j))

func check_for_line(row):
	var color = $Board.get_cell(0,row)
	var canclear = true
	for i in 6:
		if $Board.get_cell(i,row) != color:
			canclear = false
	if color == -1 or color == 3 or color == 8:
		canclear = false
	if canclear:
		for i in 6:
			$Board.set_cell(i,row,-1)
			if $Board.get_cell(i,row-1) == 3:
				$Board.set_cell(i,row-1,-1)
				var myanim = garbageclearanim.instance()
				myanim.position = $Board.map_to_world(Vector2(i,row-1)) + Vector2(8,8)
				$Board.add_child(myanim)
				var mytext = text.instance()
				mytext.position = $Board.map_to_world(Vector2(i,row-1)) + Vector2(8,8)
				mytext.text = "+10"
				$Board.add_child(mytext)
				score += 10
			if $Board.get_cell(i,row+1) == 3:
				$Board.set_cell(i,row+1,-1)
				var myanim = garbageclearanim.instance()
				myanim.position = $Board.map_to_world(Vector2(i,row+1)) + Vector2(8,8)
				$Board.add_child(myanim)
				var mytext = text.instance()
				mytext.position = $Board.map_to_world(Vector2(i,row+1)) + Vector2(8,8)
				mytext.text = "+10"
				$Board.add_child(mytext)
				score += 10
		$Audio/Clear.pitch_scale = rand_range(0.9,1.1)
		$Audio/Clear.playing = true
		line += 1
		score += 100 + streak*10
		life += (5+min(floor(streak/2),10))
		var mytext5 = text.instance()
		mytext5.position = Vector2(55,138)
		mytext5.text = "+"+String(5+min(floor(streak/2),10))
		mytext5.time = 0.4
		add_child(mytext5)
		streak += 1
		if color == lastcolor:
			colorstreak += 1
			score += 25*colorstreak
			$Audio/ColorStreak.pitch_scale = pitch_scale_whole(colorstreak-1)
			$Audio/ColorStreak.playing = true
		else:
			colorstreak = 0
			lastcolor = color
			colorstreakbonus = false
		streaktime = 10
		garbagelevel -= 1
		var myanim = lineclearanim.instance()
		myanim.type = color
		myanim.position.x = 48
		if row%2 == 1:
			myanim.position.x += 8
		myanim.position.y = 8*row+8
		$Board.add_child(myanim)
		var mytext = text.instance()
		mytext.text = "+100"
		mytext.position.x = 48
		if row%2 == 1:
			mytext.position.x += 8
		mytext.position.y = 8*row+8
		$Board.add_child(mytext)
		if streak > 1:
			var mytext2 = text.instance()
			mytext2.text = "STREAK +"+String(10*(streak-1))
			mytext2.position.x = 48
			if row%2 == 1:
				mytext2.position.x += 8
			mytext2.position.y = 8*row+16
			$Board.add_child(mytext2)
		if colorstreak > 0:
			var mytext3 = text.instance()
			mytext3.text = "COLOR +"+String(25*(colorstreak))
			mytext3.position.x = 48
			if row%2 == 1:
				mytext3.position.x += 8
			mytext3.position.y = 8*row+24
			$Board.add_child(mytext3)
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
					$Audio/Fall.pitch_scale = rand_range(0.9,1.1)
					$Audio/Fall.playing = true
					check_for_line(j+1)
				else:
					if j%2 == 0:
						if $Board.get_cell(i-1,j+1) == -1:
							$Board.set_cell(i-1,j+1,$Board.get_cell(i,j))
							$Board.set_cell(i,j,-1)
							$Audio/Fall.pitch_scale = rand_range(0.9,1.1)
							$Audio/Fall.playing = true
							check_for_line(j+1)
					else:
						if $Board.get_cell(i+1,j+1) == -1:
							$Board.set_cell(i+1,j+1,$Board.get_cell(i,j))
							$Board.set_cell(i,j,-1)
							$Audio/Fall.pitch_scale = rand_range(0.9,1.1)
							$Audio/Fall.playing = true
							check_for_line(j+1)
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
	if !gameover:
		if Input.is_action_just_released("mouse_up"):
			var save = currenttri[0]
			currenttri[0] = currenttri[2]
			currenttri[2] = currenttri[1]
			currenttri[1] = save
			$Audio/Rotate.playing = true
		if Input.is_action_just_released("mouse_down"):
			var save = currenttri[2]
			currenttri[2] = currenttri[0]
			currenttri[0] = currenttri[1]
			currenttri[1] = save
			$Audio/Rotate.playing = true
		if Input.is_action_just_released("mouse_right"):
			for i in 3:
				currenttri[i] = nexttri[i]
			piecenum += 1
			nexttri = generate_pieces()
			$Audio/Discard.pitch_scale = rand_range(0.9,1.1)
			$Audio/Discard.playing = true
			garbagelevel += 1
			for i in garbagelevel:
				$Board.set_cell(currentgarbage,0,3)
				currentgarbage += 1
				currentgarbage = currentgarbage % 6
			if garbagelevel > 3:
				var mytext2 = text.instance()
				mytext2.position = Vector2(128,16)
				mytext2.text = "GARBAGE WARNING!!"
				mytext2.special = true
				add_child(mytext2)
		if Input.is_action_just_released("mouse_left"):
			if canplace:
				$Audio/Place.pitch_scale = rand_range(0.9,1.1)
				$Audio/Place.playing = true
				var tnum = 0
				for tile in $BoardPreview.get_used_cells():
					if $Board.get_cell(tile.x,tile.y) != -1:
						var mytile = fallingtile.instance()
						mytile.position = $Board.map_to_world(tile)
						if tile.y == mousetilepos.y:
							mytile.position.y -= 8
						mytile.type = $Board.get_cell(tile.x,tile.y)
						$Board.add_child(mytile)
					$Board.set_cell(tile.x,tile.y,currenttri[tnum])
					tnum += 1
				for i in 3:
					currenttri[i] = nexttri[i]
				piecenum += 1
				nexttri = generate_pieces()
				for i in 17:
					check_for_line(i)
	elif Input.is_action_just_released("mouse_left"):
		Global.toscene = "res://scene/menu/Title.tscn"
func generate_pieces():
	var array = [randi()%3,randi()%3,randi()%3]
	if piecenum % 10 == 0:
		array[1] = 3
	if piecenum % 30 == 0:
		for i in 3:
			array[i] = 3
	return array

func pitch_scale_whole(value):
	var proc = min(value,21)
	var table = [1,1.122462,1.259921,1.334840,1.498307,1.681793,1.887749,2,2*1.122462,2*1.259921,2*1.334840,2*1.498307,2*1.681793,2*1.887749,4,4*1.122462,4*1.259921,4*1.334840,4*1.498307,4*1.681793,4*1.887749,8]
	return table[proc]
