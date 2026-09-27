extends Control

signal game_restarted

@onready var label_puntos: Label = $MarginContainer/VBoxContainer/LabelPuntos

func set_score(score):
	label_puntos.text = "Puntos: " + str(score)


func _on_boton_salir_pressed() -> void:
	get_tree().quit()


func _on_boton_reintentar_pressed() -> void:
	game_restarted.emit()
