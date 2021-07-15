extends NinePatchRect

var canpress = false
var condition = true
var nineslicepos = [
	Vector2(64,128),
	Vector2(80,128)
]

func _ready():
	$Description.visible = false

func _process(delta):
	if canpress and Input.is_action_pressed("mouse_left") and condition:
		region_rect.position = nineslicepos[1]
		$Label.set("custom_colors/font_color",Color("#61d3e3"))
	else:
		if !condition:
			region_rect.position = nineslicepos[1]
			$Label.set("custom_colors/font_color",Color("#61d3e3"))
		else:
			region_rect.position = nineslicepos[0]
			$Label.set("custom_colors/font_color",Color("#a2fff3"))
func _on_Area2D_mouse_entered():
	canpress = true
	$Description.visible = true

func _on_Area2D_mouse_exited():
	canpress = false
	$Description.visible = false
