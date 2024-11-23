extends Node


var bordes_tilemap_actual : Array[Vector2]
signal BordesTilemapCambio(bordes : Array[Vector2])

func CambiarBordesTilemap(bordes : Array[Vector2]) -> void:
	bordes_tilemap_actual = bordes
	BordesTilemapCambio.emit(bordes)
