extends CharacterBody2D

@export var recurso : StaticObstacle

@export var zigzag_amplitude : float = 300.0  # Qué tan pronunciado es el zig-zag (velocidad vertical)
@export var zigzag_frequency : float = 3.0    # Qué tan rápido sube y baja

const ENVIRONMENT_SPEED = 100.0
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var collision_shape_2d: CollisionShape2D = $Hitbox/CollisionShape2D

var time_passed : float = 0.0

func _ready() -> void:
	sprite_2d.texture = recurso.texture
	collision_shape_2d.shape = recurso.colisionForma

func _physics_process(delta: float) -> void:
	time_passed += delta
	
	velocity.x = -ENVIRONMENT_SPEED
	
	velocity.y = cos(time_passed * zigzag_frequency) * zigzag_amplitude
	
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
