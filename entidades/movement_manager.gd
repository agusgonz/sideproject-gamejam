extends Node

@export var player : CharacterBody2D

@export var jump_height : float = 64
@export var seconds_to_ascend : float = 0.5
@export var seconds_to_descend : float = 0.2

# Parabola ecuations
@onready var jump_velocity : float = ((2.0 * jump_height) / seconds_to_ascend) * -1
@onready var jump_gravity : float = ((-2.0 * jump_height) / (seconds_to_ascend * seconds_to_ascend)) * -1
@onready var fall_gravity : float = ((-2.0 * jump_height) / (seconds_to_descend * seconds_to_descend)) * -1

var speed : float


func _physics_process(delta: float) -> void:
	# Gravity
	player.velocity.y += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and player.is_on_floor():
		jump()
	
	player.move_and_slide()

func get_gravity():
	if player.velocity.y < 0:
		return jump_gravity
	else:
		return fall_gravity

func jump():
	player.velocity.y = jump_velocity
