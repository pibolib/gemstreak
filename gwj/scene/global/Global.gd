extends Node


var track = [
	preload("res://bgm/nothing.ogg"),
	preload("res://bgm/lineitup.ogg"),
	preload("res://bgm/yeah.ogg"),
	preload("res://bgm/the time machine\'s curse.ogg")
]
var currenttrack = 3
var time = 0

func _ready():
	pass

func _process(delta):
	time += delta
	if $BGM.stream != track[currenttrack]:
		$BGM.stream = track[currenttrack]
		$BGM.playing = true
	if !$BGM.playing:
		$BGM.playing = true
