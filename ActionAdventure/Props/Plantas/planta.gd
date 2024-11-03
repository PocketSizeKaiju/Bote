class_name Planta
extends Node2D

func _ready() -> void:
	$HitBox.Daniado.connect(tomoDanio)


func tomoDanio(_danio: int) -> void:
	queue_free()
