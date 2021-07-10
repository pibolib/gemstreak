extends Node


var track = [
	preload("res://bgm/nothing.ogg"),
	preload("res://bgm/lineitup.ogg")
]
var currenttrack = 1

func _ready():
	pass


func _process(delta):
	if $BGM.stream != track[currenttrack]:
		$BGM.stream = track[currenttrack]
		$BGM.playing = true
	if !$BGM.playing:
		$BGM.playing = true
