extends Node

signal cuando_subtitulos_alterna(valor : bool)

signal cuando_modo_ventana_seleccionado(indice : int)

signal cuando_resolucion_seleccionada(indice : int)

signal cuando_sonido_maestro_asignado(valor : float)
signal cuando_sonido_musica_asignado(valor : float)
signal cuando_sonido_sfx_asignado(valor : float)
signal cuando_sonido_voces_asignado(valor : float)

signal asignar_diccionario_configuracion(dicc_configuracion : Dictionary)

signal cargar_datos_configuracion(dicc_configuracion : Dictionary)


func emitir_cargar_datos_configuracion(dicc_configuracion : Dictionary) -> void:
	cargar_datos_configuracion.emit(dicc_configuracion)

func emitir_subtitulos_alternan(valor : bool) -> void:
	cuando_subtitulos_alterna.emit(valor)

func emitir_modo_ventana_seleccionado(indice : int) -> void:
	cuando_modo_ventana_seleccionado.emit(indice)

func emitir_resolucion_seleccionada(indice : int) -> void:
	cuando_resolucion_seleccionada.emit(indice)

func emitir_sonido_maestro_asignado(valor : float) -> void:
	cuando_sonido_maestro_asignado.emit(valor)
func emitir_sonido_musica_asignado(valor : float) -> void:
	cuando_sonido_musica_asignado.emit(valor)
func emitir_sonido_sfx_asignado(valor : float) -> void:
	cuando_sonido_sfx_asignado.emit(valor)
func emitir_sonido_voces_asignado(valor : float) -> void:
	cuando_sonido_voces_asignado.emit(valor)

func emitir_diccionario_configuracion(dicc_configuracion : Dictionary) -> void:
	asignar_diccionario_configuracion.emit(dicc_configuracion)
