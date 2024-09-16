extends Node2D


@export var speed := -100.0
var speed_input := speed
var old_speed_input := speed_input

@export var spawning_freq := 0.001
var spawning_freq_input := spawning_freq
var old_spawning_freq_input := spawning_freq_input

func _process(delta: float) -> void:
	#print(Level.speed)
	pass



func _verify_if_speed_changed():
	if speed_input != old_speed_input:
		old_speed_input = speed_input
		_change_speed()

func _change_speed():
	Level.speed = speed_input * -1

func _on_speed_controller_text_submitted(new_text: String) -> void:
	var speed_controller = $Settings/SettingsContainer/SpeedContainer/SpeedController
	speed_input = float(speed_controller.text)
	_verify_if_speed_changed()

func _verify_if_spawn_freq_changed():
	if spawning_freq_input != old_spawning_freq_input:
		old_spawning_freq_input = spawning_freq_input
		_change_spawning_freq()

func _change_spawning_freq():
	Level.spawning_freq = spawning_freq_input

func _on_spawn_freq_controller_text_submitted(new_text: String) -> void:
	var spawnfreq_controller = $Settings/SettingsContainer/SpawnFreqContainer/SpawnFreqController
	spawning_freq_input = float(spawnfreq_controller.text)
	_verify_if_spawn_freq_changed()
