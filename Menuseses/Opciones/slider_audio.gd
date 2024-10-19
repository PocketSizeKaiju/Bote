extends Control


@onready var nombre_audio_lbl: Label = $HBoxContainer/Nombre_Audio_Lbl as Label
@onready var valor_audio_lbl: Label = $HBoxContainer/Valor_Audio_Lbl as Label
@onready var h_slider: HSlider = $HBoxContainer/HSlider as HSlider

@export_enum("Master", "Musica", "Sfx", "Voces") var nombre_bus: String

var indice_bus : int = 0

func _ready() -> void:
	h_slider.value_changed.connect(cuando_valor_cambia)
	obtener_nombre_bus_por_index()
	cargar_datos()
	asignar_texto_nombre()
	asignar_valor_slider()

func cargar_datos() -> void:
	match nombre_bus:
		"Master":
			cuando_valor_cambia(ContenedorConfiguracion.obtener_volumen_maestro())
		"Musica":
			cuando_valor_cambia(ContenedorConfiguracion.obtener_volumen_musica())
		"Sfx":
			cuando_valor_cambia(ContenedorConfiguracion.obtener_volumen_sfx())
		"Voces":
			cuando_valor_cambia(ContenedorConfiguracion.obtener_volumen_voces())

func asignar_texto_nombre() -> void:
	nombre_audio_lbl.text = "Volumen " + str(nombre_bus)

func obtener_nombre_bus_por_index() -> void:
	indice_bus = AudioServer.get_bus_index(nombre_bus)

func asignar_texto_valor() -> void:
	valor_audio_lbl.text = str(h_slider.value * 100) + "%"

func asignar_valor_slider() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(indice_bus))
	asignar_texto_valor()

func cuando_valor_cambia(valor : float) -> void:
	AudioServer.set_bus_volume_db(indice_bus, linear_to_db(valor))
	asignar_texto_valor()
	
	match indice_bus:
		0:
			BusSenialConfiguracion.emitir_sonido_maestro_asignado(valor)
		1:
			BusSenialConfiguracion.emitir_sonido_musica_asignado(valor)
		2:
			BusSenialConfiguracion.emitir_sonido_sfx_asignado(valor)
		3:
			BusSenialConfiguracion.emitir_sonido_voces_asignado(valor)
