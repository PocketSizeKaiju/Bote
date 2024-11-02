class_name MaquinaDeEstadoJugador
extends Node

var estados : Array [Estado]
var estado_anterior : Estado
var estado_actual : Estado

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	cambiarEstado(estado_actual.proceso(delta))

func _physics_process(delta: float) -> void:
	cambiarEstado(estado_actual.fisica(delta))

func _unhandled_input(event: InputEvent) -> void:
	cambiarEstado(estado_actual.manejarInput(event))

func inicializar(_jugador: Jugador) -> void:
	estados = []
	
	for estado in get_children():
		if estado is Estado:
			estados.append(estado)
	
	if estados.size() > 0:
		estados[0].jugador = _jugador
		cambiarEstado(estados[0])
		process_mode = Node.PROCESS_MODE_INHERIT

func cambiarEstado(estado_nuevo : Estado) -> void:
	if estado_nuevo == null || estado_nuevo == estado_actual:
		return
	
	if estado_actual: 
		estado_actual.salir() 
	
	estado_anterior = estado_actual
	estado_actual = estado_nuevo
	estado_actual.entrar()
