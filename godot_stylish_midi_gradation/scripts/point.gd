extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity.x = Level.speed
	move_and_slide()
