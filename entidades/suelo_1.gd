extends AnimatableBody2D

# Velocidad a la que se mueve el mundo (debe coincidir con la de los obstáculos)
@export var scroll_speed: float = 100.0

# El ancho exacto de tu bloque de suelo (ajústalo según el tamaño de tu TileMap/Sprite)
@export var ground_width: float = 384.0 

func _physics_process(delta: float) -> void:
	# Movemos el suelo constantemente hacia la izquierda
	position.x -= scroll_speed * delta

	# Si el bloque de suelo sale completamente por la izquierda
	if position.x <= -ground_width:
		# Lo teletransportamos hacia la derecha, justo detrás del otro bloque
		position.x += ground_width * 2
