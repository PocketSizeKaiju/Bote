extends Node

@onready var CONFIGURACION_POR_DEFECTO : RecursosConfiguracionPorDefectos = preload("res://Menuseses/configuracionPorDefecto.tres")
@onready var recurso_keybind : RecursoKeybindJugador = preload("res://Menuseses/RecursoKeybindJugador.tres")

var indice_modo_ventana : int = 0
var indice_resolucion : int = 0
var volumen_maestro : float = 0.0
var volumen_musica : float = 0.0
var volumen_sfx : float = 0.0
var volumen_voces : float = 0.0
var estado_subtitulos : bool = false

var datos_cargados : Dictionary = {}

func _ready() -> void:
	manejar_seniales()
	crear_diccionario_guardado()

func crear_diccionario_guardado() -> Dictionary:
	var diccionario_contenedor_configuracion : Dictionary = {
		"indice_modo_ventana" : indice_modo_ventana,
		"indice_resolucion" : indice_resolucion,
		"volumen_maestro" : volumen_maestro,
		"volumen_musica" : volumen_musica,
		"volumen_sfx" : volumen_sfx,
		"volumen_voces" : volumen_voces,
		"estado_subtitulos" : estado_subtitulos,
		"keybinds" : crear_diccionario_keybind()
	}
	return diccionario_contenedor_configuracion

func crear_diccionario_keybind() -> Dictionary:
	var contenedor_diccionario_keybind = {
		recurso_keybind.MOVER_IZQUIERDA : recurso_keybind.tecla_mover_izquierda,
		recurso_keybind.MOVER_DERECHA : recurso_keybind.tecla_mover_derecha,
		recurso_keybind.MOVER_ARRIBA : recurso_keybind.tecla_mover_arriba,
		recurso_keybind.MOVER_ABAJO : recurso_keybind.tecla_mover_abajo,
		recurso_keybind.SALTAR : recurso_keybind.tecla_saltar,
		recurso_keybind.ATACAR : recurso_keybind.tecla_atacar
	}
	return contenedor_diccionario_keybind

func obtener_indice_modo_ventana() -> int:
	if datos_cargados == {}:
		return CONFIGURACION_POR_DEFECTO.INDICE_MODO_VENTANA_POR_DEFECTO
	return indice_modo_ventana

func obtener_indice_resolucion() -> int:
	if datos_cargados == {}:
		return CONFIGURACION_POR_DEFECTO.INDICE_RESOLUCION_POR_DEFECTO
	return indice_resolucion

func obtener_volumen_maestro() -> float:
	if datos_cargados == {}:
		return CONFIGURACION_POR_DEFECTO.VOLUMEN_MAESTRO_POR_DEFECTO
	return volumen_maestro

func obtener_volumen_musica() -> float:
	if datos_cargados == {}:
		return CONFIGURACION_POR_DEFECTO.VOLUMEN_MUSICA_POR_DEFECTO
	return volumen_musica

func obtener_volumen_sfx() -> float:
	if datos_cargados == {}:
		return CONFIGURACION_POR_DEFECTO.VOLUMEN_SFX_POR_DEFECTO
	return volumen_sfx

func obtener_volumen_voces() -> float:
	if datos_cargados == {}:
		return CONFIGURACION_POR_DEFECTO.VOLUMEN_VOCES_POR_DEFECTO
	return volumen_voces

func obtener_estado_subtitulos() -> bool:
	if datos_cargados == {}:
		return CONFIGURACION_POR_DEFECTO.ESTADO_SUBTITULOS_POR_DEFECTO
	return estado_subtitulos

func obtener_keybind(accion : String):
	if !datos_cargados.has("keybinds"):
		match accion:
			recurso_keybind.MOVER_IZQUIERDA:
				return recurso_keybind.TECLA_MOVER_IZQUIERDA_POR_DEFECTO
			recurso_keybind.MOVER_DERECHA:
				return recurso_keybind.TECLA_MOVER_DERECHA_POR_DEFECTO
			recurso_keybind.MOVER_ARRIBA:
				return recurso_keybind.TECLA_MOVER_ARRIBA_POR_DEFECTO
			recurso_keybind.MOVER_ABAJO:
				return recurso_keybind.TECLA_MOVER_ABAJO_POR_DEFECTO
			recurso_keybind.SALTAR:
				return recurso_keybind.TECLA_SALTAR_POR_DEFECTO
			recurso_keybind.ATACAR:
				return recurso_keybind.TECLA_ATACAR_POR_DEFECTO
	else:
		match accion:
			recurso_keybind.MOVER_IZQUIERDA:
				return recurso_keybind.tecla_mover_izquierda
			recurso_keybind.MOVER_DERECHA:
				return recurso_keybind.tecla_mover_derecha
			recurso_keybind.MOVER_ARRIBA:
				return recurso_keybind.tecla_mover_arriba
			recurso_keybind.MOVER_ABAJO:
				return recurso_keybind.tecla_mover_abajo
			recurso_keybind.SALTAR:
				return recurso_keybind.tecla_saltar
			recurso_keybind.ATACAR:
				return recurso_keybind.tecla_atacar

func cuando_modo_ventana_seleccionado(indice : int) -> void:
	indice_modo_ventana = indice
func cuando_resolucion_seleccionada(indice : int) -> void:
	indice_resolucion = indice
func cuando_sonido_maestro_asignado(valor : float) -> void:
	volumen_maestro = valor
func cuando_sonido_musica_asignado(valor : float) -> void:
	volumen_musica = valor
func cuando_sonido_sfx_asignado(valor : float) -> void:
	volumen_sfx = valor
func cuando_sonido_voces_asignado(valor : float) -> void:
	volumen_voces = valor
func cuando_subtitulos_alterna(valor : bool) -> void:
	estado_subtitulos = valor
func cuando_keybinds_asignados(datos : Dictionary) -> void:
	var mover_izquierda_cargado = InputEventKey.new()
	var mover_derecha_cargado = InputEventKey.new()
	var mover_arriba_cargado = InputEventKey.new()
	var mover_abajo_cargado = InputEventKey.new()
	var saltar_cargado = InputEventKey.new()
	var atacar_cargado = InputEventKey.new()
	
	mover_izquierda_cargado.set_physical_keycode(int(datos.a))
	mover_derecha_cargado.set_physical_keycode(int(datos.d))
	mover_arriba_cargado.set_physical_keycode(int(datos.w))
	mover_abajo_cargado.set_physical_keycode(int(datos.s))
	saltar_cargado.set_physical_keycode(int(datos.espacio))
	atacar_cargado.set_physical_keycode(int(datos.control))
	
	recurso_keybind.tecla_mover_izquierda = mover_izquierda_cargado
	recurso_keybind.tecla_mover_derecha = mover_derecha_cargado
	recurso_keybind.tecla_mover_arriba = mover_arriba_cargado
	recurso_keybind.tecla_mover_abajo = mover_abajo_cargado
	recurso_keybind.tecla_saltar = saltar_cargado
	recurso_keybind.tecla_atacar = atacar_cargado

func asignar_keybind(accion : String, evento) -> void:
	match accion:
		recurso_keybind.MOVER_IZQUIERDA:
			recurso_keybind.tecla_mover_izquierda = evento
		recurso_keybind.MOVER_DERECHA:
			recurso_keybind.tecla_mover_derecha = evento
		recurso_keybind.MOVER_ARRIBA:
			recurso_keybind.tecla_mover_arriba = evento
		recurso_keybind.MOVER_ABAJO:
			recurso_keybind.tecla_mover_abajo = evento
		recurso_keybind.SALTAR:
			recurso_keybind.tecla_saltar = evento
		recurso_keybind.ATACAR:
			recurso_keybind.tecla_atacar = evento

func cuando_datos_configuracion_cargados(datos : Dictionary) -> void:
	datos_cargados = datos
	cuando_modo_ventana_seleccionado(datos_cargados.indice_modo_ventana)
	cuando_resolucion_seleccionada(datos_cargados.indice_resolucion)
	cuando_sonido_maestro_asignado(datos_cargados.volumen_maestro)
	cuando_sonido_musica_asignado(datos_cargados.volumen_musica)
	cuando_sonido_sfx_asignado(datos_cargados.volumen_sfx)
	cuando_sonido_voces_asignado(datos_cargados.volumen_voces)
	cuando_subtitulos_alterna(datos_cargados.estado_subtitulos)
	cuando_keybinds_asignados(datos_cargados.keybinds)

func manejar_seniales() -> void:
	BusSenialConfiguracion.cuando_modo_ventana_seleccionado.connect(cuando_modo_ventana_seleccionado)
	BusSenialConfiguracion.cuando_resolucion_seleccionada.connect(cuando_resolucion_seleccionada)
	BusSenialConfiguracion.cuando_sonido_maestro_asignado.connect(cuando_sonido_maestro_asignado)
	BusSenialConfiguracion.cuando_sonido_musica_asignado.connect(cuando_sonido_musica_asignado)
	BusSenialConfiguracion.cuando_sonido_sfx_asignado.connect(cuando_sonido_sfx_asignado)
	BusSenialConfiguracion.cuando_sonido_voces_asignado.connect(cuando_sonido_voces_asignado)
	BusSenialConfiguracion.cuando_subtitulos_alterna.connect(cuando_subtitulos_alterna)
	
	BusSenialConfiguracion.cargar_datos_configuracion.connect(cuando_datos_configuracion_cargados)
