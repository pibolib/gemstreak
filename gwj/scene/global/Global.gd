extends Node


var track = [
	preload("res://bgm/nothing.ogg"),
	preload("res://bgm/lineitup.ogg"),
	preload("res://bgm/yeah.ogg"),
	preload("res://bgm/the time machine\'s curse.ogg"),
	preload("res://bgm/game_over.ogg")
]
var currenttrack = 2
var vol = 1
var time = 0
var currentscene = "res://scene/menu/Title.tscn"
var toscene = "res://scene/menu/Title.tscn"
var transitiontime = 0

var showtutorial = true
var highscore = 2500

func _ready():
	pass

func _process(delta):
	time += delta
	if $BGM.stream != track[currenttrack]:
		$BGM.volume_db -= 160*delta
		if $BGM.volume_db <= -80:
			$BGM.stream = track[currenttrack]
			$BGM.playing = true
	elif $BGM.volume_db < 0:
		$BGM.volume_db = 0
	if !$BGM.playing:
		$BGM.playing = true
	$CanvasLayer/Transition.rect_position.y = -200+400*transitiontime
	if currentscene != toscene:
		currenttrack = 0
		transitiontime += delta
		if transitiontime >= 0.5:
			var status
			status = get_tree().change_scene(toscene)
			print(status)
			currentscene = toscene
	elif transitiontime > 0:
		transitiontime -= delta
		
