extends CharacterBody2D

@export var texture : Texture2D

const ENVIRONMENT_SPEED = 100.0
@onready var sprite_2d: Sprite2D = $Sprite2D

func _ready() -> void:
	sprite_2d.texture = texture

func _physics_process(delta: float) -> void:
	velocity = Vector2.LEFT * ENVIRONMENT_SPEED
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
