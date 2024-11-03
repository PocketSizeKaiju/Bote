class_name Jugador
extends CharacterBody2D

const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

var direccion_cardinal : Vector2 = Vector2.DOWN
var direccion : Vector2 = Vector2.ZERO

@onready var animation_player: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D as Sprite2D
@onready var maquina_de_estados: MaquinaDeEstadoJugador = $"Maquina de Estados" as MaquinaDeEstadoJugador

signal cambioDireccion(nueva_direccion: Vector2)

func _ready() -> void:
	AdministradorGlobalJugador.jugador = self
	maquina_de_estados.inicializar(self)

func _process(_delta: float) -> void:
	direccion = Vector2(
		Input.get_axis("a", "d"),
		Input.get_axis("w", "s")
	).normalized()


func _physics_process(_delta: float) -> void:
	move_and_slide()

func asignarDireccion() -> bool:
	if direccion == Vector2.ZERO:
		return false
	
	var id_direccion: int = int(round((direccion + (direccion_cardinal*0.1)).angle()/TAU*DIR_4.size()))
	var nueva_direccion = DIR_4[id_direccion]
	
	direccion_cardinal = nueva_direccion
	cambioDireccion.emit(direccion_cardinal)
	sprite_2d.scale.x = -1 if direccion_cardinal == Vector2.LEFT else 1
	return true

func actualizarAnimacion(estado: String) -> void:
	animation_player.play(estado) # "_" + direccionAnimacion()

func direccionAnimacion() -> String:
	if direccion_cardinal == Vector2.DOWN:
		return "abajo"
	elif direccion_cardinal == Vector2.UP:
		return "arriba"
	else:
		return "costado"
