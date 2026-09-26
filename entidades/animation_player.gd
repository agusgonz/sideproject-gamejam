extends AnimationPlayer


func _on_player_player_crouched() -> void:
	play("crouch")


func _on_player_player_uncrouched() -> void:
	play("cycling")
