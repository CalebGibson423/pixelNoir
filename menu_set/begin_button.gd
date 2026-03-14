extends Button

func _on_pressed():
	SfxManager.play("Retro6")
	get_tree().change_scene_to_file("res://scenes/bar.tscn")
	MusicManager.play_next()
