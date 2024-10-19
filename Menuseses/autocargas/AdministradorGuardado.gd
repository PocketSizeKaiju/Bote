extends Node

const DIRECCION_CONFIGURACION_GUARDADA : String = "user://DatosGuardadosDeConfiguracion.guardado"

var diccionario_datos_configuracion : Dictionary = {}

func _ready() -> void:
	BusSenialConfiguracion.asignar_diccionario_configuracion.connect(cuando_guardar_configuracion)
	cargar_datos_configuracion()

func cuando_guardar_configuracion(datos : Dictionary) -> void:
	var archivo_configuracion_guardada = FileAccess.open(DIRECCION_CONFIGURACION_GUARDADA, FileAccess.WRITE)
	var json_datos = JSON.stringify(datos)
	
	archivo_configuracion_guardada.store_line(json_datos)

func cargar_datos_configuracion() -> void:
	if not FileAccess.file_exists(DIRECCION_CONFIGURACION_GUARDADA):
		return
	
	var archivo_configuracion_guardada = FileAccess.open(DIRECCION_CONFIGURACION_GUARDADA, FileAccess.READ)
	var datos_cargados : Dictionary = {}
	
	while archivo_configuracion_guardada.get_position() < archivo_configuracion_guardada.get_length():
		var json_string = archivo_configuracion_guardada.get_line()
		var json = JSON.new()
		var _resultado_parseado = json.parse(json_string)
		
		datos_cargados = json.get_data()
	
	BusSenialConfiguracion.emitir_cargar_datos_configuracion(datos_cargados)
	datos_cargados = {}
