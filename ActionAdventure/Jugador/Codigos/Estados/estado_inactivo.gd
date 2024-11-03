class_name Estado_Inactivo
extends Estado

@onready var caminar: Estado_Caminar = $"../caminar" as Estado
@onready var atacar: Estado_Atacar = $"../atacar" as Estado

#Que pasa cuando el jugador entra este estado
func entrar() -> void:
	jugador.actualizarAnimacion("inactivo")

#Que pase cuando el jugador sale del estado
func salir() -> void:
	pass

#Que pasa durante el _process update del estado
func proceso( _delta: float) -> Estado:
	if jugador.direccion != Vector2.ZERO:
		return caminar
	jugador.velocity = Vector2.ZERO
	return null

#Que pasa durante el  _physics_process update del estado
func fisica (_delta: float) -> Estado:
	return null

#Que pasa con los eventos del estado
func manejarInput (_evento: InputEvent) -> Estado:
	if _evento.is_action_pressed("control"):
		return atacar
	return null
