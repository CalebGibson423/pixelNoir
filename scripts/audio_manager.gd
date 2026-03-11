extends Node

var buses = {
	"Master": 0.5,
	"Music": 0.5,
	"SFX": 0.5
}

const SETTINGS_PATH = "user://settings.cfg"

func _ready():
	load_settings()

func set_volume(bus_name: String, value: float):
	buses[bus_name] = value
	var bus = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus, linear_to_db(value))
	
	save_settings()
	
func audio_setup() -> void:
	for bus_name in buses:
		var bus = AudioServer.get_bus_index(bus_name)
		AudioServer.set_bus_volume_db(bus, linear_to_db(buses[bus_name]))

func save_settings():
	var config = ConfigFile.new()
	
	for bus in buses:
		config.set_value("audio", bus, buses[bus])
	
	config.save(SETTINGS_PATH)
	
func load_settings():
	var config = ConfigFile.new()
	
	if config.load(SETTINGS_PATH) != OK:
		audio_setup()
		save_settings()
		return
	
	for bus in buses:
		if config.has_section_key("audio", bus):
			buses[bus] = config.get_value("audio", bus)
			
		var bus_index = AudioServer.get_bus_index(bus)
		AudioServer.set_bus_volume_db(bus_index, linear_to_db(buses[bus]))
