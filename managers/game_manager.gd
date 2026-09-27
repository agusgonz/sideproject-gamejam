extends Node

signal score_changed(score)
signal gameover(score)

@onready var canvas_layer_ui: CanvasLayer = $"../CanvasLayerUI"

var score := 0:
	set(value):
		score = value
		score_changed.emit(value)


func _on_player_murio_jugador() -> void:
	game_over()


func game_over() -> void:
	get_tree().paused = true
	gameover.emit(score)


func _on_score_timer_timeout() -> void:
	score += 1 * 100


func _on_menu_game_over_game_restarted() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
