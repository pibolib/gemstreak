extends Node

var fallingtile = preload("res://scene/maingame/fallingtile/FallingTile.tscn")
var lineclearanim = preload("res://scene/maingame/clearanims/LineClearAnim.tscn")
var garbageclearanim = preload("res://scene/maingame/clearanims/GarbageClearAnim.tscn")
var specialclearanim = preload("res://scene/maingame/clearanims/specialclearanim/SpecialClearAnim.tscn")
var text = preload("res://scene/maingame/textpopup/Text.tscn")
var shinything = preload("res://scene/maingame/etc/ShinyThing.tscn")
var bg01 = preload("res://scene/maingame/backgrounds/bg01/bg01.tscn")
var bg02 = preload("res://scene/maingame/backgrounds/bg02/bg02.tscn")
var bgtype = 0

var tutorial = false
var levelname = [
	"TUTORIAL",
	"LEVEL 1",
	"LEVEL 2",
	"LEVEL 3",
	"LEVEL 4",
	"LEVEL 5",
	"LEVEL 6",
	"LEVEL 7",
	"LEVEL 8",
	"LEVEL 9",
	"LEVEL 10",
	"LEVEL 11",
	"LEVEL 12",
	"LEVEL 13",
	"LEVEL 14",
	"LEVEL 15",
	"LEVEL 16",
	"LEVEL 17",
	"LEVEL 18",
	"LEVEL 19",
	"LEVEL 20",
	"ENDLESS"
]
var levelclear = false
var tutorialtext = [
	"Welcome to GemStreak.",
	"In this game, your goal is to line up gems of similar colors into horizontal rows. This causes them to disappear.",
	"This game is entirely controlled by the mouse. Move your cursor around the playfield, and the preview trio will follow.",
	"When you press the left mouse button, the trio of gems that are at the top of the NEXT queue will be placed into the spot the that preview specifies.",
	"If there are gems already there, they will be launched to the top of the screen.",
	"You can rotate the current trio with the rotate buttons at the bottom, or with the mouse wheel.",
	"If you cannot use the current trio anywhere, you can discard it using the trash can button at the bottom of the screen, or with the right mouse button.",
	"Be careful doing this too often, as discarding many trios will cause garbage gems to fill up the playfield, which can only be cleared by clearing a line nearby.",
	"When you clear a line, a streak timer starts in the top right. If you build up a streak, you will gain more points from each additional line cleared.",
	"Also, if you clear lines of the same color consecutively, you can gain a bonus for that too. ",
	"You can see the current color that you are on in the large gem next to your score.",
	"You can receive a special bonus when you reach a consecutive color streak of 5.",
	"The game is over if you run out of time, or if a gem is unable to immediately lock into place inside of the playfield.",
	"On the left, you can see your remaining time. You can gain time back from clearing lines. Having a higher streak gives you more time per line cleared.",
	"To complete each level, you must achieve the score goal listed under your current score.",
	"Good luck, and most importantly, have fun.",
	"When you wish to exit this mode, you can pause the game and then press the EXIT button that shows up when the game is paused.",
	"When you wish to exit this mode, you can pause the game and then press the EXIT button that shows up when the game is paused.",
	""
]
var currenttutorial = 0
var tutorialtime = 0

#game variables
var score = 0
var dscore = 0
var scrtick = 0
var scoregoal = 1000

var line = 0
var streak = 0
var streaktime = 0
var streakmulti = 1
var topstreak = 0

var lastcolor = -1
var colorstreak = 0
var colorstreakbonus = false
var colorbonus = 0
var colorstreaktable = [
	Vector2(208,64),
	Vector2(235,64),
	Vector2(262,64)
]
var pausetable = [
	Vector2(0,144),
	Vector2(16,144)
]
var pause = false

var piecenum = 1
var currenttri = [0,0,0]
var nexttri = [0,0,0]
var currenttick = 0

var garbagelevel = 0
var garbagecleared = 0

var time = 0
var test = false

var life = 120
var mlife = 180
var lifemulti = 1
var gameover = false

var mousetilepos = Vector2(0,0)
var mposcenter = Vector2(0,0)

var falltimer = 0.125

var currentgarbage = 0
var nextshine = 0.5

var bgm = 0
func _ready():
	for i in 8:
		var myline = [-1,-1,-1,-1,-1,-1]
		for j in 6:
			myline[j] = randi()%3
			$Board.set_cell(j,i+9,myline[j])
		var allsame = true
		for j in 5:
			if myline[j] != myline[j+1]:
				allsame = false
		if allsame:
			$Board.set_cell(5,i,($Board.get_cell(5,i)+1)%3)
	match Global.level:
		0:
			bgm = 1
			scoregoal = 100000
			tutorial = true
			life = 600
			mlife = 600
		1:
			bgm = 1
			scoregoal = 1000
			life = 180
			mlife = 600
			lifemulti = 2
			streakmulti = 1
		2:
			bgm = 1
			scoregoal = 1500
			life = 150
			mlife = 240
			lifemulti = 1
			streakmulti = 1
		3:
			bgm = 1
			scoregoal = 2000
			life = 150
			mlife = 180
			lifemulti = 1
			streakmulti = 1
		4:
			bgm = 1
			scoregoal = 2500
			life = 150
			mlife = 180
			lifemulti = 1
			streakmulti = 1
		5:
			bgtype = 1
			bgm = 3
			scoregoal = 3000
			life = 300
			mlife = 300
			lifemulti = 0
			streakmulti = 1
		6:
			bgtype = 1
			bgm = 3
			scoregoal = 4000
			life = 300
			mlife = 300
			lifemulti = 0
			streakmulti = 0.9
		7:
			bgtype = 1
			bgm = 3
			scoregoal = 4500
			life = 300
			mlife = 300
			lifemulti = 0
			streakmulti = 0.8
		8:
			bgtype = 1
			bgm = 3
			scoregoal = 5000
			life = 330
			mlife = 330
			lifemulti = 0
			streakmulti = 0.7
		9:
			bgtype = 1
			bgm = 3
			scoregoal = 6000
			life = 330
			mlife = 330
			lifemulti = 0
			streakmulti = 0.6
		10:
			bgtype = 2
			bgm = 5
			scoregoal = 2000
			life = 60
			mlife = 60
			lifemulti = 0.5
			streakmulti = 1
		11:
			bgtype = 2
			bgm = 5
			scoregoal = 2500
			life = 60
			mlife = 60
			lifemulti = 0.5
			streakmulti = 1
		12:
			bgtype = 2
			bgm = 5
			scoregoal = 4000
			life = 45
			mlife = 75
			lifemulti = 0.6
			streakmulti = 1
		13:
			bgtype = 2
			bgm = 5
			scoregoal = 6000
			life = 45
			mlife = 90
			lifemulti = 0.6
			streakmulti = 1
		14:
			bgtype = 2
			bgm = 5
			scoregoal = 8000
			life = 30
			mlife = 90
			lifemulti = 0.7
			streakmulti = 1
		15:
			bgtype = 3
			bgm = 7
			scoregoal = 10000
			life = 120
			mlife = 180
			lifemulti = 1
			streakmulti = 0.3
		16:
			bgtype = 3
			bgm = 7
			scoregoal = 12500
			life = 30
			mlife = 60
			lifemulti = 1.2
			streakmulti = 0.4
		17:
			bgtype = 3
			bgm = 7
			scoregoal = 15000
			life = 600
			mlife = 600
			lifemulti = 0
			streakmulti = 0.5
		18:
			bgtype = 3
			bgm = 7
			scoregoal = 20000
			life = 600
			mlife = 600
			lifemulti = 0
			streakmulti = 1
		19:
			bgtype = 3
			bgm = 7
			scoregoal = 25000
			life = 30
			mlife = 120
			lifemulti = 1
			streakmulti = 0.7
		20:
			bgtype = 3
			bgm = 7
			scoregoal = 30000
			life = 120
			mlife = 600
			lifemulti = 0.5
			streakmulti = 0.5
		21:
			bgtype = 4
			bgm = 1
			scoregoal = 9999999
			life = 120
			mlife = 180
			lifemulti = 1
			streakmulti = 1
	var bg = bg01.instance()
	bg.type = bgtype
	add_child(bg)
	currenttri = generate_pieces()
	nexttri = generate_pieces()
func _process(delta):
	if Global.level == 21 and life > 0:
		if line < 100:
			bgm = 1
		elif line < 200:
			bgm = 3
		elif line < 300:
			bgm = 5
		else:
			bgm = 7
	if !pause and tutorial:
		if tutorial:
			$UI/Tutorial.text = tutorialtext[currenttutorial]
			tutorialtime += delta
			if tutorialtime >= 10:
				tutorialtime = 0
				if currenttutorial < tutorialtext.size()-1:
					currenttutorial += 1
	for area in $PauseChamp/Click.get_overlapping_areas():
		if Input.is_action_just_pressed("mb_left"):
			if pause:
				pause = false
			else:
				pause = true
	$PauseChamp.region_rect.position = pausetable[int(pause)]
	if score >= scoregoal:
		if !levelclear:
			$Audio/LevelClear.playing = true
			levelclear = true
			bgm = 0
		for child in $Board.get_children():
			child.queue_free()
		gameover = true
	if score > Global.highscore and Global.level == 21:
		Global.highscore = score
	if Global.level == 21:
		mlife = max(180-floor(line/10)*5,30)
	if !pause:
		if gameover:
			if score >= scoregoal:
				$UI/Win.visible = true
			else:
				$UI/Lose.visible = true
			if $Board.modulate.a > 0:
				$Board.modulate.a -= delta
				$BoardConnections.modulate.a -= delta
				$BoardPreview.modulate.a -= delta
			else:
				$UI/Statistics.text = "-"+levelname[Global.level]+" STATISTICS-\n\n-SCORE-\n"+String(score)
				if Global.level == 21 and score == Global.highscore:
					$UI/Statistics.text += " (NEW BEST!)"
				$UI/Statistics.text += "\n\n-MAX STREAK-\n"+String(topstreak)
				if topstreak == line and topstreak > 0 and streaktime > 0:
					$UI/Statistics.text += " (PERFECT!)"
				$UI/Statistics.text += "\n\n-GARBAGE CLEARED-\n"+String(garbagecleared)+"\n\n-COLOR BONUSES-\n"+String(colorbonus)
				$UI/Statistics.visible = true
				$UI/Statistics.percent_visible += delta
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
			Global.currenttrack = 4
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
			life += 10
			colorbonus += 1
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
						garbagecleared += 1
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
		if !gameover:
			if !tutorial:
				life -= delta
			falltimer -= delta
		if falltimer <= 0:
			falltimer = 0.25
			check_for_falling(-1)
			check_for_falling(-2)
			for i in 22:
				check_for_falling(17-i)
				check_for_line(17-i)
		time += delta
		if !gameover:
			if life < 15:
				if $Audio/Warning.playing == false:
					$Audio/Warning.playing = true
				if int(time) % 2 == 0:
					$UI/LowTime.visible = false
				else:
					$UI/LowTime.visible = true
			else:
				$UI/LowTime.visible = false
			streaktime = clamp(streaktime,0,max(5,10-0.05*streak)*streakmulti)
			if streaktime > 0:
				streaktime -= delta
			else:
				streak = 0
		streaktime = clamp(streaktime,0,10)
		garbagelevel = clamp(garbagelevel,0,6)
		life = clamp(life,0,mlife)
		process_mouse()
	update_info()

func update_info():
	$Info.text = "Streak: "+String(streak)+" ("+String(streaktime)+")\nGarbage Level: "+String(garbagelevel)
	$NextDisplay.set_cell(2,4,currenttri[0])
	$NextDisplay.set_cell(1,5,currenttri[1])
	$NextDisplay.set_cell(2,5,currenttri[2])
	$NextDisplay.set_cell(2,8,nexttri[0])
	$NextDisplay.set_cell(1,9,nexttri[1])
	$NextDisplay.set_cell(2,9,nexttri[2])
	if Global.level != 21:
		$UI/Score.text = String(dscore).pad_zeros(5)+"\n"+String(scoregoal).pad_zeros(5)
	else:
		$UI/Score.text = String(dscore).pad_zeros(5)+"\n"+String(Global.highscore).pad_zeros(5)
	if lastcolor != -1:
		$Streak.region_rect.position = colorstreaktable[lastcolor]
	$UI/ColorStreak.text = String(colorstreak)
	$UI/Time.text = String(int(life/60))+":"+String(int(life)%60).pad_zeros(2)
	$UI/Streak.text = String(streak)
	$Streak3.offset.y = floor(60*((10-streaktime)/10))+1
	$Streak3.region_rect.size.y = floor(60*(streaktime)/10)
	$UI/LineCount.text = String(line)
	$NextDisplay.visible = !pause
	$Board.visible = !pause
	$BoardConnections.visible = !pause
	$BoardPreview.visible = !pause
	$UI/Pause.visible = pause
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
	if color == -1 or color == 3 or color == 8 or color == 4:
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
				garbagecleared += 1
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
				garbagecleared += 1
		$Audio/Clear.pitch_scale = rand_range(0.9,1.1)
		$Audio/Clear.playing = true
		line += 1
		score += 100 + streak*10
		life += floor((5+min(floor(streak/2),10))*lifemulti)
		var mytext5 = text.instance()
		mytext5.position = Vector2(55,138)
		mytext5.text = "+"+String(floor((5+min(floor(streak/2),10))*lifemulti))
		mytext5.time = 0.4
		add_child(mytext5)
		streak += 1
		if streak > topstreak:
			topstreak = streak
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
		if int(row)%2 == 1:
			myanim.position.x += 8
		myanim.position.y = 8*row+8
		$Board.add_child(myanim)
		var mytext = text.instance()
		mytext.text = "+100"
		mytext.position.x = 48
		if int(row)%2 == 1:
			mytext.position.x += 8
		mytext.position.y = 8*row+8
		$Board.add_child(mytext)
		if streak > 1:
			var mytext2 = text.instance()
			mytext2.text = "STREAK +"+String(10*(streak-1))
			mytext2.position.x = 48
			if int(row)%2 == 1:
				mytext2.position.x += 8
			mytext2.position.y = 8*row+16
			$Board.add_child(mytext2)
		if colorstreak > 0:
			var mytext3 = text.instance()
			mytext3.text = "COLOR +"+String(25*(colorstreak))
			mytext3.position.x = 48
			if int(row)%2 == 1:
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
		if score >= scoregoal:
			if Global.level != 21 and Global.level > Global.highestlevel and !tutorial:
				Global.highestlevel = Global.level
		Global.toscene = "res://scene/menu/Title.tscn"
		Global.preloadmenu = 1
		Global.update_save()
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

