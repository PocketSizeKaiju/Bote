extends Node2D

func _ready() -> void:
	visible = false
	if AdministradorJugador.jugador_invocado == false:
		AdministradorJugador.asignar_posicion_jugador(global_position)
		AdministradorJugador.jugador_invocado = true
