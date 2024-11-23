class_name TileMapNivel
extends TileMapLayer

func _ready() -> void:
	AdministradorNiveles.CambiarBordesTilemap(
		ObtenerBordesTilemap()
	)

func ObtenerBordesTilemap() -> Array[Vector2]:
	var bordes: Array[Vector2] = []
	bordes.append(
		Vector2(
			get_used_rect().position * rendering_quadrant_size
		)
	)
	bordes.append(
		Vector2(
			get_used_rect().end * rendering_quadrant_size
		)
	)
	return bordes
