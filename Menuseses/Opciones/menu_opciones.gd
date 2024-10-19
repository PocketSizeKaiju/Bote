class_name MenuOpciones
extends Control

@onready var boton_salir = $MarginContainer/VBoxContainer/BotonSalir as Button
@onready var contenedor_tab_configuraciones: ContenedorTabConfiguracion = $MarginContainer/VBoxContainer/Contenedor_Tab_configuraciones as ContenedorTabConfiguracion

signal salir_menu_opciones

func _ready():
	boton_salir.button_down.connect(cuando_salir_apretado)
	contenedor_tab_configuraciones.Salir_Menu_Opciones.connect(cuando_salir_apretado)
	set_process(false)

func cuando_salir_apretado() -> void:
	salir_menu_opciones.emit()
	BusSenialConfiguracion.emitir_diccionario_configuracion(ContenedorConfiguracion.crear_diccionario_guardado())
	set_process(false)
