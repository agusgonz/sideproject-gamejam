extends CharacterBody2D
signal murio_jugador

@onready var colision_pie = $HurtBoxDePie/ColisionDePie
@onready var colision_agachado = $HurtBoxAgachado/ColisionAgachado

func _physics_process(delta):
	
	# Lógica de agacharse (ej: flecha abajo)
	if Input.is_action_pressed("ui_down") and is_on_floor():
		colision_pie.disabled = true
		colision_agachado.disabled = false
		# Aquí luego reproducirás la animación de agacharse
	else:
		colision_pie.disabled = false
		colision_agachado.disabled = true
		# Aquí luego reproducirás la animación de correr


func _on_hurt_box_de_pie_area_entered(area: Area2D) -> void:
	murio_jugador.emit()
