extends CanvasLayer

@onready var menu_game_over: Control = $MenuGameOver
@onready var score_label: Label = $ScoreLabel


func game_over() -> void:
	menu_game_over.show()
	score_label.hide()

func game_restart() -> void:
	menu_game_over.hide()


func _on_game_manager_gameover(score) -> void:
	game_over()
	menu_game_over.set_score(score)
