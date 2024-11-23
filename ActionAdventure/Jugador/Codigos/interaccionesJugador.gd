class_name InteraccionesJugador
extends Node2D

@onready var jugador: Jugador = $".." as Jugador

func _ready() -> void:
	jugador.cambioDireccion.connect(actualizarDireccion)

func actualizarDireccion(nueva_direccion: Vector2) -> void:
	match nueva_direccion:
		Vector2.DOWN:
			rotation_degrees = 0
		Vector2.UP:
			rotation_degrees = 180
		Vector2.LEFT:
			rotation_degrees = 90
		Vector2.RIGHT:
			rotation_degrees = -90
		_:
			rotation_degrees = 0
