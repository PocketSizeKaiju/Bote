class_name  Nivel
extends Node2D

func _ready() -> void:
	self.y_sort_enabled = true
	AdministradorJugador.asignar_como_padre(self)
