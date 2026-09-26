extends Node

signal score_changed(score)

var score := 0:
	set(value):
		score = value
		score_changed.emit(value)

func _on_player_murio_jugador() -> void:
	game_over()
	



func game_over() -> void:
	get_tree().paused = true
	get_tree().change_scene_to_file("res://UI/MenuGameOver.tscn")


func _on_score_timer_timeout() -> void:
	score += 1 * 100
	

func restart_game() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main.tscn")
	
