class_name RecursoKeybindJugador
extends Resource

const MOVER_IZQUIERDA : String = "a"
const MOVER_DERECHA : String = "d"
const MOVER_ARRIBA : String = "w"
const MOVER_ABAJO : String = "s"
const SALTAR : String = "espacio"
const ATACAR : String = "control"

@export var TECLA_MOVER_IZQUIERDA_POR_DEFECTO = InputEventKey.new()
@export var TECLA_MOVER_DERECHA_POR_DEFECTO = InputEventKey.new()
@export var TECLA_MOVER_ARRIBA_POR_DEFECTO = InputEventKey.new()
@export var TECLA_MOVER_ABAJO_POR_DEFECTO = InputEventKey.new()
@export var TECLA_SALTAR_POR_DEFECTO = InputEventKey.new()
@export var TECLA_ATACAR_POR_DEFECTO = InputEventKey.new()

var tecla_mover_izquierda = InputEventKey.new()
var tecla_mover_derecha = InputEventKey.new()
var tecla_mover_arriba = InputEventKey.new()
var tecla_mover_abajo = InputEventKey.new()
var tecla_saltar = InputEventKey.new()
var tecla_atacar = InputEventKey.new()
