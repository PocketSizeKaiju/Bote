class_name CamaraJugador
extends Camera2D

func _ready() -> void:
	AdministradorNiveles.BordesTilemapCambio.connect(actualizarLimites)
	actualizarLimites(AdministradorNiveles.bordes_tilemap_actual)

func actualizarLimites(bordes: Array[Vector2]) -> void:
	if bordes == []: return
	limit_left = int(bordes[0].x)
	limit_top = int(bordes[0].y)
	limit_right = int(bordes[1].x)
	limit_bottom = int(bordes[1].y)
