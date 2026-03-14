extends Node

var sounds = {
	"Abstract1" : preload("res://audio/SFX/Abstract1.wav"),
	"Abstract2" : preload("res://audio/SFX/Abstract2.wav"),
	"African1" : preload("res://audio/SFX/African1.wav"),
	"African2" : preload("res://audio/SFX/African2.wav"),
	"African3" : preload("res://audio/SFX/African3.wav"),
	"African4" : preload("res://audio/SFX/African4.wav"),
	"Coffee1" : preload("res://audio/SFX/Coffee1.wav"),
	"Coffee2" : preload("res://audio/SFX/Coffee2.wav"),
	"Footsteps5" : preload("res://audio/SFX/Footsteps_Tile_Run_05.wav"),
	"Minimalist1" : preload("res://audio/SFX/Minimalist1.wav"),
	"Minimalist2" : preload("res://audio/SFX/Minimalist2.wav"),
	"Minimalist3" : preload("res://audio/SFX/Minimalist3.wav"),
	"Minimalist4" : preload("res://audio/SFX/Minimalist4.wav"),
	"Minimalist5" : preload("res://audio/SFX/Minimalist5.wav"),
	"Minimalist6" : preload("res://audio/SFX/Minimalist6.wav"),
	"Minimalist7" : preload("res://audio/SFX/Minimalist7.wav"),
	"Minimalist8" : preload("res://audio/SFX/Minimalist8.wav"),
	"Minimalist9" : preload("res://audio/SFX/Minimalist9.wav"),
	"Minimalist10" : preload("res://audio/SFX/Minimalist10.wav"),
	"Minimalist11" : preload("res://audio/SFX/Minimalist11.wav"),
	"Minimalist12" : preload("res://audio/SFX/Minimalist12.wav"),
	"Minimalist13" : preload("res://audio/SFX/Minimalist13.wav"),
	"Modern1" : preload("res://audio/SFX/Modern1.wav"),
	"Modern2" : preload("res://audio/SFX/Modern2.wav"),
	"Modern3" : preload("res://audio/SFX/Modern3.wav"),
	"Modern4" : preload("res://audio/SFX/Modern4.wav"),
	"Modern5" : preload("res://audio/SFX/Modern5.wav"),
	"Modern6" : preload("res://audio/SFX/Modern6.wav"),
	"Modern7" : preload("res://audio/SFX/Modern7.wav"),
	"Modern8" : preload("res://audio/SFX/Modern8.wav"),
	"Modern9" : preload("res://audio/SFX/Modern9.wav"),
	"Modern10" : preload("res://audio/SFX/Modern10.wav"),
	"Modern11" : preload("res://audio/SFX/Modern11.wav"),
	"Modern12" : preload("res://audio/SFX/Modern12.wav"),
	"Modern13" : preload("res://audio/SFX/Modern13.wav"),
	"Modern14" : preload("res://audio/SFX/Modern14.wav"),
	"Modern15" : preload("res://audio/SFX/Modern15.wav"),
	"Modern16" : preload("res://audio/SFX/Modern16.wav"),
	"Retro1" : preload("res://audio/SFX/Retro1.wav"),
	"Retro2" : preload("res://audio/SFX/Retro2.wav"),
	"Retro3" : preload("res://audio/SFX/Retro3.wav"),
	"Retro4" : preload("res://audio/SFX/Retro4.wav"),
	"Retro5" : preload("res://audio/SFX/Retro5.wav"),
	"Retro6" : preload("res://audio/SFX/Retro6.wav"),
	"Retro7" : preload("res://audio/SFX/Retro7.wav"),
	"Retro8" : preload("res://audio/SFX/Retro8.wav"),
	"Retro9" : preload("res://audio/SFX/Retro9.wav"),
	"Retro10" : preload("res://audio/SFX/Retro10.wav"),
	"Retro11" : preload("res://audio/SFX/Retro11.wav"),
	"Retro12" : preload("res://audio/SFX/Retro12.wav"),
	"Block1" : preload("res://audio/SFX/Wood Block1.wav"),
	"Block2" : preload("res://audio/SFX/Wood Block2.wav"),
	"Block3" : preload("res://audio/SFX/Wood Block3.wav")
}

@onready var players = [
	$SFXPlayer1,
	$SFXPlayer2,
	$SFXPlayer3,
	$SFXPlayer4
]

var current_player := 0

func play(sound: String):
	if not sounds.has(sound):
		return

	var player = players[current_player]
	player.stream = sounds[sound]
	player.play()

	current_player = (current_player + 1) % players.size()

func play_pitch(sound_name: String, min_pitch=0.9, max_pitch=1.1):
	var player = players[current_player]
	player.pitch_scale = randf_range(min_pitch, max_pitch)
	play(sound_name)
