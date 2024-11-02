class_name Estado_Caminar
extends Estado

@export var velocidad_mover : float = 100.0

@onready var inactivo: Estado_Inactivo = $"../inactivo" as Estado

#Que pasa cuando el jugador entra este estado
func entrar() -> void:
	jugador.actualizarAnimacion("caminar")

#Que pase cuando el jugador sale del estado
func salir() -> void:
	pass

#Que pasa durante el _process update del estado
func proceso( _delta: float) -> Estado:
	if jugador.direccion == Vector2.ZERO:
		return inactivo
	jugador.velocity = jugador.direccion*velocidad_mover
	
	if jugador.asignarDireccion():
		jugador.actualizarAnimacion("caminar")
	return null

#Que pasa durante el  _physics_process update del estado
func fisica (_delta: float) -> Estado:
	return null

#Que pasa con los eventos del estado
func manejarInput (_evento: InputEvent) -> Estado:
	return null
