class_name Planta
extends Node2D

func _ready() -> void:
	$HitBox.Daniado.connect(tomoDanio)


func tomoDanio(_hit_box: CajaDeDanio) -> void:
	queue_free()
