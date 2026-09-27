extends Node

@export var GameManager: Node 
@export var difficultyCurve: Curve
@export var enemies2D: Node2D
@onready var spawn_point_terrestre: Marker2D = $SpawnPointTerrestre
@onready var spawn_point_volador: Marker2D = $SpawnPointVolador
@onready var spawn_timer: Timer = $SpawnTimer

const CONO = preload("uid://bv77qs3r4f2jt")
const OBJETO_VOLADOR = preload("uid://3r6yk02vktnf")

const OBSTACULO_ESTATICO = preload("uid://d3ncwt7t1u7g0")

var enemigos := [CONO, OBJETO_VOLADOR]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_enemigo_estatico()


func _on_spawn_timer_timeout() -> void:
	spawn_enemigo_estatico()

func spawn_enemigo_estatico() -> void:
	var obstaculoEstaticoInstanciado: CharacterBody2D = OBSTACULO_ESTATICO.instantiate()
	var enemigo = enemigos.pick_random()
	obstaculoEstaticoInstanciado.recurso = enemigo
	enemies2D.add_child(obstaculoEstaticoInstanciado)
	var spawnPointsGlobalPosition
	if enemigo.tipo == "TERRESTRE":
		spawnPointsGlobalPosition = spawn_point_terrestre.global_position
	else:
		spawnPointsGlobalPosition = spawn_point_volador.global_position
	
	
	obstaculoEstaticoInstanciado.global_position = spawnPointsGlobalPosition
