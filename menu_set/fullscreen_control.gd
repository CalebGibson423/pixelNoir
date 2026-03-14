extends CheckButton

func _on_toggled(toggled_on: bool) -> void:
	SfxManager.play("Retro5")
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
