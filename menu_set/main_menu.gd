extends Control

@onready var main_buttons: BoxContainer = $MainButtons
@onready var options: Panel = $OptionPanel

# audio sliders 
@onready var master_slider = $OptionPanel/Options/AudioOptions/VBoxContainer/MasterSlider
@onready var music_slider = $OptionPanel/Options/AudioOptions/VBoxContainer/MusicSlider
@onready var sfx_slider = $OptionPanel/Options/AudioOptions/VBoxContainer/SFXSlider

func _ready():
	main_buttons.visible = true
	options.visible = false
	
	master_slider.value = AudioManager.buses["Master"]
	music_slider.value = AudioManager.buses["Music"]
	sfx_slider.value = AudioManager.buses["SFX"]
	
func _on_button_3_pressed() -> void:
	pass # Replace with function body.

func _on_options_b_pressed() -> void:
	main_buttons.visible = false
	options.visible = true

func _on_exit_b_pressed():
	get_tree().quit()

func _on_option_exit_pressed():
	main_buttons.visible = true
	options.visible = false
	
# audio setting changes
func _on_master_slider_value_changed(value: float):
	AudioManager.set_volume("Master", value)

func _on_music_slider_value_changed(value: float):
	AudioManager.set_volume("Music", value)

func _on_sfx_slider_value_changed(value: float):
	AudioManager.set_volume("SFX", value)
	
