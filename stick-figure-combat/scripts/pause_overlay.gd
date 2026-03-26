extends ColorRect

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			_resume()
		else:
			_pause()

func _pause():
	visible = true
	get_tree().paused = true

func _resume():
	visible = false
	get_tree().paused = false

func _on_quit_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
