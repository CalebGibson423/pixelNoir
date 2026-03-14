extends AudioStreamPlayer

var music_playlist = {
	#creepy
	"A Place I've Seen Before" : preload("res://audio/music/creepy/A Place I've Seen Before.mp3"),
	"Ceiling Stars" : preload("res://audio/music/creepy/Ceiling Stars.mp3"),
	"Comfort" : preload("res://audio/music/creepy/Comfort.mp3"),
	"Echoes at Dusk Spoti" : preload("res://audio/music/creepy/Echoes at Dusk Spoti.mp3"),
	"Echoes at Dusk" : preload("res://audio/music/creepy/Echoes at Dusk.mp3"),
	"Empty Hope" : preload("res://audio/music/creepy/Empty Hope.mp3"),
	"I Can't Go On" : preload("res://audio/music/creepy/I Can't Go On.mp3"),
	"Insufficient" : preload("res://audio/music/creepy/Insufficient.mp3"),
	"Keep it up" : preload("res://audio/music/creepy/Keep it up.mp3"),
	"Lonely Nightmare" : preload("res://audio/music/creepy/Lonely Nightmare.mp3"),
	"Lost in Polaroids" : preload("res://audio/music/creepy/Lost in Polaroids.mp3"),
	"Lying Down" : preload("res://audio/music/creepy/Lying Down.mp3"),
	"Moonlight" : preload("res://audio/music/creepy/Moonlight.mp3"),
	"My Room" : preload("res://audio/music/creepy/My Room.mp3"),
	"Reflection" : preload("res://audio/music/creepy/Reflection.mp3"),
	"Saved Notes Spoti" : preload("res://audio/music/creepy/Saved Notes Spoti.mp3"),
	"Saved Notes" : preload("res://audio/music/creepy/Saved Notes.mp3"),
	"Sayuri" : preload("res://audio/music/creepy/Sayuri.mp3"),
	"Sealed" : preload("res://audio/music/creepy/Sealed.mp3"),
	"Silent Voices" : preload("res://audio/music/creepy/Silent Voices.mp3"),
	"Subtle Changes" : preload("res://audio/music/creepy/Subtle Changes.mp3"),
	"Tempest" : preload("res://audio/music/creepy/Tempest.mp3"),
	"Value" : preload("res://audio/music/creepy/Value.mp3"),
	"Without a Trace" : preload("res://audio/music/creepy/Without a Trace.mp3"),
	
	# vibe
	"Dark Atmosphere to Synth" : preload("res://audio/music/vibe/Dark Atmosphere to Synth.wav"),
	"Dystopian" : preload("res://audio/music/vibe/Dystopian.wav"),
	"Empty Streets" : preload("res://audio/music/vibe/Empty Streets.wav"),
	"Mystery Unsolved" : preload("res://audio/music/vibe/Mystery Unsolved.wav"),
	"Surveillance" : preload("res://audio/music/vibe/Surveillance.wav"),
	"The Nightclub" : preload("res://audio/music/vibe/The Nightclub.wav"),
	"The Protagonist" : preload("res://audio/music/vibe/The Protagonist.wav"),
	"The Story Continues" : preload("res://audio/music/vibe/The Story Continues.wav")
} 
 
var shuffled_keys: Array = []
var current_index := 0

func _ready():
	randomize()
	shuffle_playlist()
	finished.connect(_on_song_finished)
	play_next()
	
func shuffle_playlist():
	shuffled_keys = music_playlist.keys()
	shuffled_keys.shuffle()
	current_index = 0
	
func play_next():
	if current_index >= shuffled_keys.size():
		shuffle_playlist()

	var song_name = shuffled_keys[current_index]
	stream = music_playlist[song_name]
	play()

	current_index += 1 
	
func play_song(song: String):
	if not music_playlist.has(song):
		push_warning("Song not found: " + song)
		return
	
	if stream == music_playlist[song] and playing:
		return

	stream = music_playlist[song]
	play()
	
func _on_song_finished():
	play_next()
	
func play_playlist():
	stop()
	play_next()
