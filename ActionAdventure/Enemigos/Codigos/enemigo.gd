class_name Enemigo
extends CharacterBody2D

const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

signal cambioDireccion(nueva_direccion: Vector2)
signal enemigo_daniado()

@export var hp: int = 3

@onready var animation_player: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D as Sprite2D
@onready var maquina_estado_enemigo: MaquinaDeEstadoEnemigo = $MaquinaEstadoEnemigo as MaquinaDeEstadoEnemigo
#@onready var hit_box: HitBox = $HitBos as HitBox

var direccion_cardinal : Vector2 = Vector2.DOWN
var direccion : Vector2 = Vector2.ZERO
var jugador: Jugador
var invulnerable: bool = false

func _ready() -> void:
	maquina_estado_enemigo.inicializar(self)
	jugador = AdministradorGlobalJugador.jugador

func _physics_process(_delta: float) -> void:
	move_and_slide()

func asignarDireccion(_nueva_direccion: Vector2) -> bool:
	direccion = _nueva_direccion
	if direccion == Vector2.ZERO:
		return false
	
	var id_direccion: int = int(round((direccion + (direccion_cardinal*0.1)).angle()/TAU*DIR_4.size()))
	var nueva_direccion = DIR_4[id_direccion]
	
	direccion_cardinal = nueva_direccion
	cambioDireccion.emit(direccion_cardinal)
	sprite_2d.scale.x = -1 if direccion_cardinal == Vector2.LEFT else 1
	return true

func actualizarAnimacion(estado: String) -> void:
	animation_player.play(estado + "_" + direccionAnimacion())

func direccionAnimacion() -> String:
	if direccion_cardinal == Vector2.DOWN:
		return "abajo"
	elif direccion_cardinal == Vector2.UP:
		return "arriba"
	else:
		return "costado"
