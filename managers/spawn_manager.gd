extends Node

@export var GameManager: Node 
@export var difficultyCurve: Curve
@export var enemies2D: Node2D
@onready var spawn_point_terrestre: Marker2D = $SpawnPointTerrestre
@onready var spawn_point_volador: Marker2D = $SpawnPointVolador
@onready var spawn_timer: Timer = $SpawnTimer

const OBSTACULO_ESTATICO = preload("uid://d3ncwt7t1u7g0")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_enemigo_estatico()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_spawn_timer_timeout() -> void:
	spawn_enemigo_estatico()

func spawn_enemigo_estatico() -> void:
	var obstaculoEstaticoInstanciado: CharacterBody2D = OBSTACULO_ESTATICO.instantiate()
	enemies2D.add_child(obstaculoEstaticoInstanciado)
	
	var spawnPointsGlobalPosition = [spawn_point_terrestre.global_position, spawn_point_volador.global_position]
	
	obstaculoEstaticoInstanciado.global_position = spawnPointsGlobalPosition.pick_random()
