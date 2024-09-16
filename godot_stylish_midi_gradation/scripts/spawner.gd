extends Marker2D

const POINTSCENE = preload("res://scenes/point.tscn")
var midi_connected := false
var midi_value := 0.0

func _ready() -> void:
	await get_tree().create_timer(0.01).timeout
	_spawn_cycle()
	pass

func _spawn_cycle():
	_spawn_point()
	await get_tree().create_timer(Level.spawning_freq).timeout
	_spawn_cycle()

func _process(delta: float) -> void:
	print(midi_value)
	_handle_position()

func _handle_position():
	match midi_connected:
		true:
			_midi_handle_positon()
		false:
			_mouse_handle_position()

func _mouse_handle_position():
	var mouse_pos = get_global_mouse_position()
	self.position.y = mouse_pos.y

func _midi_handle_positon():
	self.position.y = midi_value

func _spawn_point():
	var point = POINTSCENE.instantiate()
	point.global_position = self.global_position
	get_parent().add_child(point)


func _on_midi_input_handler_midi_connection() -> void:
	midi_connected = true

func _on_midi_input_handler_midi_infos(pc_midi_value: Variant) -> void:
	midi_value = pc_midi_value * 600
	
