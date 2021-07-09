extends Node

#game variables
var score = 0

var streak = 0
var streaktime = 0

var currenttri = [0,0,0]

var garbagelevel = 0

func _ready():
	pass

func _process(delta):
	update_info()

func update_info():
	$Info.text = "Score: "+String(score)+"\nStreak: "+String(streak)+" ("+String(streaktime)+")\nGarbage Level: "+String(garbagelevel)
func update_board():
	pass

func check_for_line(row):
	pass

