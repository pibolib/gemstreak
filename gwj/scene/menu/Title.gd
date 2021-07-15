extends Node2D

var buttons = [
	preload("res://scene/menu/buttons/PlayButton.tscn"),
	preload("res://scene/menu/buttons/OptionsButton.tscn"),
	preload("res://scene/menu/buttons/PlayTutorial.tscn"),
	preload("res://scene/menu/buttons/BackToMain.tscn"),
	preload("res://scene/menu/buttons/PlayStory.tscn"),
	preload("res://scene/menu/buttons/PlayEndless.tscn"),
	preload("res://scene/menu/buttons/PlayPart1.tscn"),
	preload("res://scene/menu/buttons/PlayPart2.tscn"),
	preload("res://scene/menu/buttons/PlayPart3.tscn"),
	preload("res://scene/menu/buttons/PlayPart4.tscn"),
	preload("res://scene/menu/buttons/BackToPlay.tscn"),
	preload("res://scene/menu/buttons/PlayLevel.tscn"),
	preload("res://scene/menu/buttons/BackToStory.tscn"),
	preload("res://scene/menu/buttons/MusicVolumeDisplay.tscn"),
	preload("res://scene/menu/buttons/MusicVolumeUp.tscn"),
	preload("res://scene/menu/buttons/MusicVolumeDown.tscn"),
	preload("res://scene/menu/buttons/AudioVolumeDisplay.tscn"),
	preload("res://scene/menu/buttons/AudioVolumeUp.tscn"),
	preload("res://scene/menu/buttons/AudioVolumeDown.tscn")
]
var time = 0
var pos = 0

func _ready():
	Global.currenttrack = 2

func _process(delta):
	time += delta

func load_menu(menu):
	for child in $UI.get_children():
		child.queue_free()
	var list = []
	match menu:
		0:
			list = [buttons[0],buttons[1]]
		1:
			list = [buttons[2],buttons[3],buttons[4],buttons[5]]
		2: 
			list = [buttons[3],buttons[13],buttons[14],buttons[15],buttons[16],buttons[17],buttons[18]]
		3:
			list = [buttons[6],buttons[7],buttons[8],buttons[9],buttons[10]]
	for i in list.size():
		var button = list[i].instance()
		$UI.add_child(button)

func load_story_menu(menu):
	for child in $UI.get_children():
		child.queue_free()
	match menu:
		0:
			var button = buttons[12].instance()
			button.rect_position = Vector2(16,136-24)
			$UI.add_child(button)
			add_story_button(1,Vector2(16,136))
			add_story_button(2,Vector2(96,136))
			add_story_button(3,Vector2(16,160))
			add_story_button(4,Vector2(96,160))
		1:
			var button = buttons[12].instance()
			button.rect_position = Vector2(16,136-24)
			$UI.add_child(button)
			add_story_button(5,Vector2(96,136-24))
			add_story_button(6,Vector2(16,136))
			add_story_button(7,Vector2(96,136))
			add_story_button(8,Vector2(16,160))
			add_story_button(9,Vector2(96,160))
		2:
			var button = buttons[12].instance()
			button.rect_position = Vector2(16,136-24)
			$UI.add_child(button)
			add_story_button(10,Vector2(96,136-24))
			add_story_button(11,Vector2(16,136))
			add_story_button(12,Vector2(96,136))
			add_story_button(13,Vector2(16,160))
			add_story_button(14,Vector2(96,160))
		3:
			var button = buttons[12].instance()
			button.rect_position = Vector2(16,136-48)
			$UI.add_child(button)
			add_story_button(15,Vector2(16,136-24))
			add_story_button(16,Vector2(96,136-24))
			add_story_button(17,Vector2(16,136))
			add_story_button(18,Vector2(96,136))
			add_story_button(19,Vector2(16,160))
			add_story_button(20,Vector2(96,160))
func add_story_button(level, pos2):
	var button = buttons[11].instance()
	button.rect_position = pos2
	button.level = level
	$UI.add_child(button)
