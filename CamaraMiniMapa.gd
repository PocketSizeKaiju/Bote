extends Camera3D

@onready var jugador = $"../../../../../Bote"

func _ready(): 
	get_viewport().transparent_bg = true

func _process(_delta):
	position = Vector3(jugador.position.x, position.y, jugador.position.z)
