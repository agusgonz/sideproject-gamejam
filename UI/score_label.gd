extends Label


func _on_game_manager_score_changed(score: Variant) -> void:
	text = "Puntos: " + str(score)
