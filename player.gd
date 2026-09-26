extends CharacterBody2D
signal murio_jugador

const JUMP_VELOCITY = -600.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var colision_pie = $HurtBoxDePie/ColisionDePie
@onready var colision_agachado = $HurtBoxAgachado/ColisionAgachado

func _physics_process(delta):
	# Aplicar gravedad
	if not is_on_floor():
		velocity.y += gravity * delta

	# Lógica de salto (ej: barra espaciadora o flecha arriba)
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Lógica de agacharse (ej: flecha abajo)
	if Input.is_action_pressed("ui_down") and is_on_floor():
		colision_pie.disabled = true
		colision_agachado.disabled = false
		# Aquí luego reproducirás la animación de agacharse
	else:
		colision_pie.disabled = false
		colision_agachado.disabled = true
		# Aquí luego reproducirás la animación de correr

	move_and_slide()
	
func _on_hurt_box_de_pie_area_entered(area: Area2D) -> void:
	murio_jugador.emit()
