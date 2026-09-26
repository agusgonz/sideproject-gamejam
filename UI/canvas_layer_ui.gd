extends CanvasLayer

@onready var menu_game_over: Control = $MenuGameOver

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func game_over() -> void:
	menu_game_over.show()
	
func game_restart() -> void:
	menu_game_over.hide()
