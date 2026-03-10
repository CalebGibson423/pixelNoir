extends Control

@onready var main_buttons: BoxContainer = $MainButtons

@onready var options: Panel = $OptionPanel


func _ready():
	main_buttons.visible = true
	options.visible = false

func _on_button_3_pressed() -> void:
	pass # Replace with function body.


func _on_options_b_pressed() -> void:
	main_buttons.visible = false
	options.visible = true


func _on_exit_b_pressed():
	get_tree().quit()
