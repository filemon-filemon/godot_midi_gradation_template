extends Control

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("toggle_settings"):
		_toggle_settings()

func _toggle_settings():
	match self.visible:
		true:
			self.visible = false
		false:
			self.visible = true
