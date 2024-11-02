class_name Jugador
extends CharacterBody2D

var direccion_cardinal : Vector2 = Vector2.DOWN
var direccion : Vector2 = Vector2.ZERO

@onready var animation_player: AnimationPlayer = $AnimationPlayer as AnimationPlayer
@onready var sprite_2d: Sprite2D = $Sprite2D as Sprite2D
@onready var maquina_de_estados: MaquinaDeEstadoJugador = $"Maquina de Estados" as MaquinaDeEstadoJugador

func _ready() -> void:
	maquina_de_estados.inicializar(self)

func _process(_delta: float) -> void:
	direccion.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	direccion.y = Input.get_action_strength("s") - Input.get_action_strength("w")


func _physics_process(_delta: float) -> void:
	move_and_slide()

func asignarDireccion() -> bool:
	var nueva_direccion : Vector2 = direccion_cardinal
	if direccion == Vector2.ZERO:
		return false
	
	if direccion.y == 0:
		nueva_direccion = Vector2.LEFT if direccion.x < 0 else Vector2.RIGHT
	elif direccion.x == 0:
		nueva_direccion = Vector2.UP if direccion.y < 0 else Vector2.DOWN
	
	direccion_cardinal = nueva_direccion
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
