extends Node

@export var GameManager: Node 
@export var difficultyCurve: Curve
@export var enemies2D: Node2D
@onready var spawn_point_terrestre: Marker2D = $SpawnPointTerrestre
@onready var spawn_point_volador: Marker2D = $SpawnPointVolador
@onready var spawn_point_movible: Marker2D = $SpawnPointMovible
@onready var spawn_timer: Timer = $SpawnTimer

const CONO = preload("uid://bv77qs3r4f2jt")
const OBJETO_VOLADOR = preload("uid://3r6yk02vktnf")
const OBJETO_MOVIBLE = preload("uid://16x1dcjlarcb")

const OBSTACULO_ESTATICO = preload("uid://d3ncwt7t1u7g0")
const OBSTACULO_MOVIL = preload("uid://dnkpu3bb3pbsj")

var enemigos := [CONO, OBJETO_VOLADOR, OBJETO_MOVIBLE]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawn_enemigo_estatico()


func _on_spawn_timer_timeout() -> void:
	spawn_enemigo_estatico()

func spawn_enemigo_estatico() -> void:
	var obstaculoInstanciado
	var enemigo = enemigos.pick_random()
	var spawnPointsGlobalPosition
	if enemigo.tipo == "MOVIBLE":
		obstaculoInstanciado = OBSTACULO_MOVIL.instantiate()
	else:
		obstaculoInstanciado = OBSTACULO_ESTATICO.instantiate()
	
	obstaculoInstanciado.recurso = enemigo
	enemies2D.add_child(obstaculoInstanciado)
	if enemigo.tipo == "TERRESTRE":
		spawnPointsGlobalPosition = spawn_point_terrestre.global_position
	elif enemigo.tipo == "MOVIBLE":
		spawnPointsGlobalPosition = spawn_point_movible.global_position
	else:
		spawnPointsGlobalPosition = spawn_point_volador.global_position
	
	
	obstaculoInstanciado.global_position = spawnPointsGlobalPosition
