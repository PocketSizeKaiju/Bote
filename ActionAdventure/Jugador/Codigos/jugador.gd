class_name Jugador
extends CharacterBody2D

const DIR_4 = [Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT, Vector2.UP]

var direccion_cardinal : Vector2 = Vector2.DOWN
var direccion : Vector2 = Vector2.ZERO

@export_category("Stats")
@export var invulnerable: bool = false
@export var hp: int = 6
@export var max_hp: int = 6

@onready var animation_player: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var animation_player_efecto: AnimationPlayer = $AnimationPlayerEfecto as AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D as Sprite2D
@onready var maquina_de_estados: MaquinaDeEstadoJugador = $"Maquina de Estados" as MaquinaDeEstadoJugador
@onready var hit_box: HitBox = $HitBox as HitBox

signal cambioDireccion(nueva_direccion: Vector2)
signal jugador_daniado(caja_danio: CajaDeDanio)

func _ready() -> void:
	AdministradorJugador.jugador = self
	maquina_de_estados.inicializar(self)
	hit_box.Daniado.connect(_tomar_danio)
	actualizar_hp(99)

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
	animation_player.play(estado + "_" + direccionAnimacion())

func direccionAnimacion() -> String:
	if direccion_cardinal == Vector2.DOWN:
		return "abajo"
	elif direccion_cardinal == Vector2.UP:
		return "arriba"
	else:
		return "costado"

func _tomar_danio(caja_danio: CajaDeDanio) -> void:
	if invulnerable == true:
		return
	actualizar_hp(-caja_danio.danio)
	if hp > 0:
		jugador_daniado.emit(caja_danio)
	else:
		jugador_daniado.emit(caja_danio)
		actualizar_hp(99)

func actualizar_hp(delta: int) -> void:
	hp = clampi(hp + delta, 0, max_hp)
	HudJugador.actualizar_hp(hp, max_hp)

func hacer_invulnerable(_duracion: float = 1.0) -> void:
	invulnerable = true
	hit_box.monitoring = false
	
	await get_tree().create_timer(_duracion).timeout
	
	invulnerable = false
	hit_box.monitoring = true
