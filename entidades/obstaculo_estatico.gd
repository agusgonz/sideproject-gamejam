extends CharacterBody2D

@export var recurso : StaticObstacle

const ENVIRONMENT_SPEED = 100.0
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $Hitbox/CollisionShape2D
var difficulty := 1

func _ready() -> void:
	sprite_2d.texture = recurso.texture
	collision_shape_2d.shape = recurso.colisionForma

func _physics_process(delta: float) -> void:
	velocity = Vector2.LEFT * ENVIRONMENT_SPEED * difficulty
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
