extends CharacterBody2D


const ENVIRONMENT_SPEED = 40.0


func _physics_process(delta: float) -> void:
	velocity = Vector2.LEFT * ENVIRONMENT_SPEED
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
