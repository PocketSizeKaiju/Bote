class_name HitBox
extends Area2D

signal Daniado(caja_danio: CajaDeDanio)

func tomarGolpe(caja_danio: CajaDeDanio) -> void:
	Daniado.emit(caja_danio)
