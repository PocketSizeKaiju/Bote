class_name HitBox
extends Area2D

signal Daniado(valor_danio: int)

func tomarGolpe(danio: int) -> void:
	print("Ouch! ", danio)
	Daniado.emit(danio)
