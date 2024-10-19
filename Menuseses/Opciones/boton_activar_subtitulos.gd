extends Control

@onready var lbl_estado: Label = $HBoxContainer/Lbl_Estado as Label
@onready var check_button: CheckButton = $HBoxContainer/CheckButton as CheckButton


func _ready() -> void:
	check_button.toggled.connect(cuando_alternar_subtitulos)
	cargar_datos()

func cargar_datos() -> void:
	cuando_alternar_subtitulos(ContenedorConfiguracion.obtener_estado_subtitulos())
	check_button.button_pressed = ContenedorConfiguracion.obtener_estado_subtitulos()

func asignar_texto_etiqueta(boton_apretado : bool) -> void:
	if boton_apretado != true:
		lbl_estado.text = "Desactivado"
	else:
		lbl_estado.text = "Activado"


func cuando_alternar_subtitulos(boton_apretado : bool) -> void:
	asignar_texto_etiqueta(boton_apretado)
	BusSenialConfiguracion.emitir_subtitulos_alternan(boton_apretado)
