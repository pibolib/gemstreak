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
	pass
	
func _process(delta):
	time += delta
	update_info()
	if time > 0.25 and !test:
		var mytile = fallingtile.instance()
		mytile.position = Vector2(0,0)
		mytile.type = 3
		$Board.add_child(mytile)
		var mytile2 = fallingtile.instance()
		mytile2.position = Vector2(16,0)
		mytile2.type = 3
		$Board.add_child(mytile2)
		var mytile3 = fallingtile.instance()
		mytile3.position = Vector2(32,0)
		mytile3.type = 3
		$Board.add_child(mytile3)
		test = true

func update_info():
	$Info.text = "Score: "+String(score)+"\nStreak: "+String(streak)+" ("+String(streaktime)+")\nGarbage Level: "+String(garbagelevel)
func update_board():
	pass

func check_for_line(row):
	pass

