extends CharacterBody2D

signal player_crouched
signal player_uncrouched
signal murio_jugador

@onready var colision_pie = $HurtBoxDePie/ColisionDePie
@onready var colision_agachado = $HurtBoxAgachado/ColisionAgachado

func _physics_process(delta):
	
	# Lógica de agacharse
	if Input.is_action_just_pressed("crouch"):
		colision_pie.disabled = true
		colision_agachado.disabled = false
		player_crouched.emit()
	elif Input.is_action_just_released("crouch"):
		colision_pie.disabled = false
		colision_agachado.disabled = true
		player_uncrouched.emit()


func _on_hurt_box_de_pie_area_entered(area: Area2D) -> void:
	murio_jugador.emit()
