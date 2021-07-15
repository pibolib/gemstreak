extends Node


var track = [
	preload("res://bgm/nothing.ogg"),
	preload("res://bgm/lineitup.ogg"),
	preload("res://bgm/yeah.ogg"),
	preload("res://bgm/the time machine\'s curse.ogg"),
	preload("res://bgm/game_over.ogg"),
	preload("res://bgm/use your time wisely.ogg")
]
var currenttrack = 2
var vol = 1
var time = 0
var currentscene = "res://scene/menu/Title.tscn"
var toscene = "res://scene/menu/Title.tscn"
var transitiontime = 0
var hasseeninstruction = false

var highscore = 2500
var highestlevel = 0
var level = 18

func _ready():
	load_save()

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
		
func load_save():
	var file = File.new()
	if !file.file_exists("user://save.pib"):
		file.open("user://save.pib", File.WRITE)
		file.store_line(String(int(highscore)))
		file.store_line(String(hasseeninstruction))
		file.store_line(String(highestlevel))
		file.close()
	file.open("user://save.pib", File.READ)
	highscore = int(file.get_line())
	hasseeninstruction = bool(file.get_line())
	highestlevel = int(file.get_line())
	file.close()
func update_save():
	var file = File.new()
	file.open("user://save.pib", File.WRITE)
	file.store_line(String(int(highscore)))
	file.store_line(String(hasseeninstruction))
	file.store_line(String(highestlevel))
	file.close()

